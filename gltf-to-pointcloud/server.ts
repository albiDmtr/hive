import express from "express";
import * as THREE from "three";
import { NodeIO } from "@gltf-transform/core";
import { writeFileSync, unlinkSync } from "fs";
import { join } from "path";

const app = express();
app.use(express.json());

async function glbToPointCloud(
  glbPath: string,
  numberOfPoints: number,
): Promise<{ x: number; y: number; z: number }[]> {
  const response = await fetch(glbPath);
  if (!response.ok) {
    throw new Error(`Failed to download: ${response.statusText}`);
  }

  const arrayBuffer = await response.arrayBuffer();
  const buffer = Buffer.from(arrayBuffer);

  // Save temporarily (gltf-transform needs a file path)
  const tempPath = join(process.cwd(), "temp.glb");
  writeFileSync(tempPath, buffer);

  try {
    // Parse the GLB file
    const io = new NodeIO();
    const document = await io.read(tempPath);

    const mesh = document.getRoot().listMeshes()[0];

    if (!mesh) {
      throw new Error("No mesh found in GLB file");
    }

    // Extract triangles from all primitives in the mesh
    const triangles = [];

    for (const primitive of mesh.listPrimitives()) {
      const position = primitive.getAttribute("POSITION");
      if (!position) continue;

      const positionArray = position.getArray() || [];
      const indices = primitive.getIndices();

      if (indices) {
        // Indexed geometry
        const indexArray = indices.getArray() || [];
        for (let i = 0; i < indexArray.length; i += 3) {
          const i0 = indexArray[i] * 3;
          const i1 = indexArray[i + 1] * 3;
          const i2 = indexArray[i + 2] * 3;

          triangles.push({
            v0: [
              positionArray[i0],
              positionArray[i0 + 1],
              positionArray[i0 + 2],
            ],
            v1: [
              positionArray[i1],
              positionArray[i1 + 1],
              positionArray[i1 + 2],
            ],
            v2: [
              positionArray[i2],
              positionArray[i2 + 1],
              positionArray[i2 + 2],
            ],
          });
        }
      } else {
        // Non-indexed geometry
        for (let i = 0; i < positionArray.length; i += 9) {
          triangles.push({
            v0: [positionArray[i], positionArray[i + 1], positionArray[i + 2]],
            v1: [
              positionArray[i + 3],
              positionArray[i + 4],
              positionArray[i + 5],
            ],
            v2: [
              positionArray[i + 6],
              positionArray[i + 7],
              positionArray[i + 8],
            ],
          });
        }
      }
    }

    if (triangles.length === 0) {
      throw new Error("No triangles found in mesh");
    }

    // Calculate area of each triangle for weighted sampling
    const areas = triangles.map((tri) => triangleArea(tri.v0, tri.v1, tri.v2));
    const totalArea = areas.reduce((sum, area) => sum + area, 0);
    const cumulativeAreas = [];
    let sum = 0;
    for (const area of areas) {
      sum += area;
      cumulativeAreas.push(sum);
    }

    // Generate n points by sampling triangles proportional to their area
    const points = [];
    for (let i = 0; i < numberOfPoints; i++) {
      // Select triangle weighted by area
      const rand = Math.random() * totalArea;
      const triangleIndex = cumulativeAreas.findIndex((ca) => ca >= rand);
      const triangle = triangles[triangleIndex];

      // Sample random point on the triangle using barycentric coordinates
      const point = sampleTriangle(triangle.v0, triangle.v1, triangle.v2);
      points.push({ x: point[0], y: point[1], z: point[2] });
    }

    return points;
  } finally {
    // Clean up temp file
    unlinkSync(tempPath);
  }

  return [];
}

/**
 * Calculate the area of a triangle
 */
function triangleArea(v0: number[], v1: number[], v2: number[]) {
  // Using cross product: Area = 0.5 * ||(v1 - v0) × (v2 - v0)||
  const edge1 = [v1[0] - v0[0], v1[1] - v0[1], v1[2] - v0[2]];
  const edge2 = [v2[0] - v0[0], v2[1] - v0[1], v2[2] - v0[2]];

  const cross = [
    edge1[1] * edge2[2] - edge1[2] * edge2[1],
    edge1[2] * edge2[0] - edge1[0] * edge2[2],
    edge1[0] * edge2[1] - edge1[1] * edge2[0],
  ];

  const length = Math.sqrt(cross[0] ** 2 + cross[1] ** 2 + cross[2] ** 2);
  return 0.5 * length;
}

/**
 * Sample a random point on a triangle using barycentric coordinates
 */
function sampleTriangle(v0: number[], v1: number[], v2: number[]) {
  // Uniform sampling using square root method
  let r1 = Math.random();
  let r2 = Math.random();

  const sqrtR1 = Math.sqrt(r1);
  const a = 1 - sqrtR1;
  const b = sqrtR1 * (1 - r2);
  const c = sqrtR1 * r2;

  return [
    a * v0[0] + b * v1[0] + c * v2[0],
    a * v0[1] + b * v1[1] + c * v2[1],
    a * v0[2] + b * v1[2] + c * v2[2],
  ];
}

app.post("/glb-to-pointcloud", async (req, res) => {
  try {
    const { url, numberOfPoints = 500 } = req.body;

    if (!url) {
      return res.status(400).json({ error: "URL is required" });
    }

    const points = await glbToPointCloud(url, numberOfPoints);

    res.json({
      success: true,
      pointCount: points.length,
      points: points,
    });
  } catch (error: any) {
    console.error("Error processing GLB:", error);
    res.status(500).json({
      success: false,
      error: error.message,
    });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
