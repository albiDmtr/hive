import { LSTween } from "LSTween.lspkg/LSTween";
import Easing from "LSTween.lspkg/TweenJS/Easing";

/**
 * CircleAreaInstantiator - TypeScript version of the C# utility
 * Instantiates prefabs within a circular area
 */
@component
export class ParticleHive extends BaseScriptComponent {
  // References to scene objects
  @input
  @hint("Center of the circle area")
  center!: SceneObject;

  @input
  @hint("Number of prefabs to instantiate")
  numberOfPrefabs: number = 600;

  @input
  @hint("Prefab to instantiate")
  prefab!: ObjectPrefab;

  @input
  @hint("Radius of the circle")
  radius: number = 5.0;

  private animCycleMs = 3000;
  private noiseAmplitude = 3;

  public applyShape(points: { x: number; y: number; z: number }[]) {
    this.instantiatePrefabs();
  }

  private setTimeout(f: () => void, delayMs: number) {
    var delayedEvent = this.createEvent("DelayedCallbackEvent");
    delayedEvent.bind(function (eventData) {
      f();
    });

    delayedEvent.reset(delayMs / 1000);
  }

  private setInterval(f: () => void, delayMs: number) {
    f();
    this.setTimeout(() => {
      this.setInterval(f, delayMs);
    }, delayMs);
  }

  // Initialize with the proper pattern
  onAwake(): void {
    this.createEvent("OnStartEvent").bind(() => {
      this.onStart();
      print("Onstart event triggered");
    });
  }

  onStart(): void {
    this.instantiatePrefabs();
  }

  // Method to instantiate prefabs within the circle area
  instantiatePrefabs(): void {
    if (!this.center || !this.prefab) {
      print("Error: Center or prefab not assigned!");
      return;
    }

    const centerPosition = this.center.getTransform().getWorldPosition();

    const particles: {
      obj: SceneObject;
      pos: { x: number; y: number; z: number };
    }[] = [];

    for (let i = 0; i < this.numberOfPrefabs; i++) {
      // Random angle and distance to place the prefab
      const alpha = Math.random() * Math.PI * 2;
      const beta = Math.random() * Math.PI * 2;
      const distance = this.radius;

      // Calculate position based on angle and distance
      const randomPosition = new vec3(
        centerPosition.x + Math.sin(alpha) * Math.cos(beta) * distance,
        centerPosition.y + Math.sin(beta) * Math.sin(alpha) * distance,
        centerPosition.z + Math.cos(alpha) * distance,
      );

      // Create a prefab instance at the random position
      const particle = this.createPrefabInstance(
        new vec3(randomPosition.x, randomPosition.y, randomPosition.z),
      );

      const pWithPos = { obj: particle, pos: randomPosition };
      particles.push(pWithPos);

      this.startAnimation(pWithPos, i);
    }
  }

  private startAnimation(
    particle: { obj: SceneObject; pos: { x: number; y: number; z: number } },
    index: number,
  ) {
    const initialDuration = this.animCycleMs / (index / this.numberOfPrefabs);

    let transform = particle.obj.getTransform();
    let originalPosition = new vec3(
      particle.pos.x,
      particle.pos.y,
      particle.pos.z,
    );
    let destinationPosition = originalPosition.add(
      new vec3(
        Math.random() * this.noiseAmplitude,
        Math.random() * this.noiseAmplitude,
        Math.random() * this.noiseAmplitude,
      ),
    );
    LSTween.moveFromToLocal(
      transform,
      originalPosition,
      destinationPosition,
      initialDuration,
    ).start();

    // Continue animation after n ms
    this.setTimeout(() => {
      this.setInterval(() => {
        this.animateParticle(particle);
      }, this.animCycleMs);
    }, initialDuration);
  }

  private animateParticle(particle: {
    obj: SceneObject;
    pos: { x: number; y: number; z: number };
  }) {
    let transform = particle.obj.getTransform();

    let startPosition = transform.getLocalPosition();

    let originalPosition = new vec3(
      particle.pos.x,
      particle.pos.y,
      particle.pos.z,
    );
    let destinationPosition = originalPosition.add(
      new vec3(
        Math.random() * this.noiseAmplitude,
        Math.random() * this.noiseAmplitude,
        Math.random() * this.noiseAmplitude,
      ),
    );
    LSTween.moveFromToLocal(
      transform,
      startPosition,
      destinationPosition,
      this.animCycleMs,
    ).start();
  }

  // Helper method to create a prefab instance at a specific position
  private createPrefabInstance(position: vec3): SceneObject {
    if (this.prefab) {
      const instance = this.prefab.instantiate(this.sceneObject);
      instance.getTransform().setWorldPosition(position);

      return instance;
    }
  }
}
