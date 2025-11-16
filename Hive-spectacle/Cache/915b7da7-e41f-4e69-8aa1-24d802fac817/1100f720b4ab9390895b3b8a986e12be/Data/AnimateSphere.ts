import { LSTween } from "LSTween.lspkg/LSTween";
import Easing from "LSTween.lspkg/TweenJS/Easing";

/**
 * CircleAreaInstantiator - TypeScript version of the C# utility
 * Instantiates prefabs within a circular area
 */
@component
export class CircleAreaInstantiatorTS extends BaseScriptComponent {
    // References to scene objects
    @input
    @hint("Center of the circle area")
    center!: SceneObject;
    
    @input
    @hint("Prefab to instantiate")
    prefab!: ObjectPrefab;
    
    @input
    @hint("Number of prefabs to instantiate")
    numberOfPrefabs: number = 10;
    
    @input
    @hint("Radius of the circle")
    radius: number = 5.0;

    private animCycleMs = 3000;
    
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
        
        const particles: {obj: SceneObject, pos: {x: number; y: number; z: number}}[] = [];

        for (let i = 0; i < this.numberOfPrefabs; i++) {
            // Random angle and distance to place the prefab
            const alpha = Math.random() * Math.PI * 2;
            const beta = Math.random() * Math.PI * 2;
            const distance = this.radius;
            
            // Calculate position based on angle and distance
            const randomPosition = new vec3(
                centerPosition.x + Math.sin(alpha) * Math.cos(beta) * distance,
                centerPosition.y +  Math.sin(beta) * Math.sin(alpha) * distance,
                centerPosition.z + Math.cos(alpha) * distance
            );
            
            // Create a prefab instance at the random position
            const particle = this.createPrefabInstance(new vec3(
                randomPosition.x,
                randomPosition.y,
                randomPosition.z
            ));

            const pWithPos = {obj: particle, pos: randomPosition};
            particles.push(pWithPos);

            this.setTimeout(() => {
                this.animateParticle(pWithPos);
            }, this.animCycleMs / (i / this.numberOfPrefabs))
        }

    }

    private setTimeout(f: () => void, delayMs: number) {
        var delayedEvent = this.createEvent("DelayedCallbackEvent");
        delayedEvent.bind(function(eventData)
        {
            f();
        });

        delayedEvent.reset(delayMs / 1000);
    }

    private animateParticle(particle: {obj: SceneObject; pos: {x: number; y: number; z: number}}) {
        const noiseAmplitude = 3;
        
        let transform = particle.obj.getTransform();

        let startPosition = transform.getLocalPosition();

        let originalPosition = new vec3(
            particle.pos.x,
            particle.pos.y,
            particle.pos.z
        );
        let destinationPosition = originalPosition.add(
            new vec3(
                Math.random() * noiseAmplitude,
                Math.random() * noiseAmplitude,
                Math.random() * noiseAmplitude
            )
        );
        LSTween.moveFromToLocal(
            transform,
            startPosition,
            destinationPosition,
            1500
        )
        .easing(Easing.Cubic.InOut)
        .start();
    }
    
    // Helper method to create a prefab instance at a specific position
    private createPrefabInstance(position: vec3): SceneObject {
        if (this.prefab) {
       
            // In a real implementation, we would use StudioLib's actual instantiation API
            // For this example, we'll just log what would happen
            print(`Created prefab instance at position: ${position.x}, ${position.y}, ${position.z}`);
            
            // The actual instantiation code would be something like:
            const instance = this.prefab.instantiate(this.sceneObject);
            instance.getTransform().setWorldPosition(position);

            return instance;
        }
    }
}