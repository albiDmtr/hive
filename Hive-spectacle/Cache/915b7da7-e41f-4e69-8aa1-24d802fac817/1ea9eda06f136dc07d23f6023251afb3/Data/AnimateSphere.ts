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
            const particle = this.createPrefabInstance(randomPosition);
            particles.push({obj: particle, pos: {x: 0, y: 0, z: 0}})
        }

        particles.forEach((p) => {this.animateParticle(p)})
    }

    private animateParticle(particle: {obj: SceneObject; pos: {x: number; y: number}}) {
        let transform = particle.obj.getTransform();
        let startPosition = new vec3(
            particle.pos.x,
            particle.pos.y,
            particle.pos.z
        );
        let destinationPosition = startPosition.add(
            new vec3(
                Math.random() * 5,
                Math.random() * 5,
                Math.random() * 5
            )
        );
        LSTween.moveFromToLocal(
            this.getTransform(),
            startPosition,
            destinationPosition,
            1500
        )
        .easing(Easing.Cubic.InOut)
        .delay(100) // There is a bug in TweenJS where the yoyo value will jump if no delay is set.
        .yoyo(true)
        .repeat(Infinity)
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