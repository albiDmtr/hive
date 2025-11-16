import { Snap3D } from "RemoteServiceGateway.lspkg/HostedSnap/Snap3D";
import { Snap3DTypes } from "RemoteServiceGateway.lspkg/HostedSnap/Snap3DTypes";

@component
export class Snap3DExample extends BaseScriptComponent {
  onAwake() {
    this.createEvent("OnStartEvent").bind(() => {
      this.do3DGeneration();
    });
  }
  do3DGeneration() {
    Snap3D.submitAndGetStatus({
      prompt: "A hotdog",
      format: "glb",
      refine: true,
      use_vertex_color: false,
    })
      .then((submitGetStatusResults) => {
        submitGetStatusResults.event.add(([value, assetOrError]) => {
          if (value === "image") {
            let imageAsset = assetOrError as Snap3DTypes.TextureAssetData;
            //Apply imageAsset.texture;
          } else if (value === "base_mesh") {
            let gltfAsset = assetOrError as Snap3DTypes.GltfAssetData;
            this.extractVertices(gltfAsset);
          } else if (value === "refined_mesh") {
            let gltfAsset = assetOrError as Snap3DTypes.GltfAssetData;
            this.extractVertices(gltfAsset);
          } else if (value === "failed") {
            let error = assetOrError as {
              errorMsg: string;
              errorCode: number;
            };
            print("Error: " + error.errorMsg);
          }
        });
      })
      .catch((error) => {
        print("Error: " + error);
      });
  }

  private extractVertices = (gltfAsset: Snap3DTypes.GltfAssetData) => {
    // Implement vertex extraction logic here
  };
}
