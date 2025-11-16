"use strict";
var __esDecorate = (this && this.__esDecorate) || function (ctor, descriptorIn, decorators, contextIn, initializers, extraInitializers) {
    function accept(f) { if (f !== void 0 && typeof f !== "function") throw new TypeError("Function expected"); return f; }
    var kind = contextIn.kind, key = kind === "getter" ? "get" : kind === "setter" ? "set" : "value";
    var target = !descriptorIn && ctor ? contextIn["static"] ? ctor : ctor.prototype : null;
    var descriptor = descriptorIn || (target ? Object.getOwnPropertyDescriptor(target, contextIn.name) : {});
    var _, done = false;
    for (var i = decorators.length - 1; i >= 0; i--) {
        var context = {};
        for (var p in contextIn) context[p] = p === "access" ? {} : contextIn[p];
        for (var p in contextIn.access) context.access[p] = contextIn.access[p];
        context.addInitializer = function (f) { if (done) throw new TypeError("Cannot add initializers after decoration has completed"); extraInitializers.push(accept(f || null)); };
        var result = (0, decorators[i])(kind === "accessor" ? { get: descriptor.get, set: descriptor.set } : descriptor[key], context);
        if (kind === "accessor") {
            if (result === void 0) continue;
            if (result === null || typeof result !== "object") throw new TypeError("Object expected");
            if (_ = accept(result.get)) descriptor.get = _;
            if (_ = accept(result.set)) descriptor.set = _;
            if (_ = accept(result.init)) initializers.unshift(_);
        }
        else if (_ = accept(result)) {
            if (kind === "field") initializers.unshift(_);
            else descriptor[key] = _;
        }
    }
    if (target) Object.defineProperty(target, contextIn.name, descriptor);
    done = true;
};
var __runInitializers = (this && this.__runInitializers) || function (thisArg, initializers, value) {
    var useValue = arguments.length > 2;
    for (var i = 0; i < initializers.length; i++) {
        value = useValue ? initializers[i].call(thisArg, value) : initializers[i].call(thisArg);
    }
    return useValue ? value : void 0;
};
var __setFunctionName = (this && this.__setFunctionName) || function (f, name, prefix) {
    if (typeof name === "symbol") name = name.description ? "[".concat(name.description, "]") : "";
    return Object.defineProperty(f, "name", { configurable: true, value: prefix ? "".concat(prefix, " ", name) : name });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ParticleHive = void 0;
var __selfType = requireType("./ParticleHive");
function component(target) {
    target.getTypeName = function () { return __selfType; };
    if (target.prototype.hasOwnProperty("getTypeName"))
        return;
    Object.defineProperty(target.prototype, "getTypeName", {
        value: function () { return __selfType; },
        configurable: true,
        writable: true
    });
}
const LSTween_1 = require("LSTween.lspkg/LSTween");
/**
 * CircleAreaInstantiator - TypeScript version of the C# utility
 * Instantiates prefabs within a circular area
 */
let ParticleHive = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var ParticleHive = _classThis = class extends _classSuper {
        constructor() {
            super();
            // References to scene objects
            this.center = this.center;
            this.numberOfPrefabs = this.numberOfPrefabs;
            this.prefab = this.prefab;
            this.radius = this.radius;
            this.animCycleMs = 3000;
            this.noiseAmplitude = 3;
            this.particles = [];
        }
        __initialize() {
            super.__initialize();
            // References to scene objects
            this.center = this.center;
            this.numberOfPrefabs = this.numberOfPrefabs;
            this.prefab = this.prefab;
            this.radius = this.radius;
            this.animCycleMs = 3000;
            this.noiseAmplitude = 3;
            this.particles = [];
        }
        applyShape(points) {
            print(JSON.stringify(points));
            print("Applying shape");
            if (points.length !== this.particles.length) {
                print("Number of points does not match number of particles");
                return;
            }
            const scalingFactor = 3;
            for (let i = 0; i < points.length; i++) {
                const particle = this.particles[i];
                const point = points[i];
                particle.pos = {
                    x: point.x * this.radius * scalingFactor,
                    y: point.y * this.radius * scalingFactor,
                    z: point.z * this.radius * scalingFactor,
                };
            }
            print("Shape applied");
        }
        setTimeout(f, delayMs) {
            var delayedEvent = this.createEvent("DelayedCallbackEvent");
            delayedEvent.bind(function (eventData) {
                f();
            });
            delayedEvent.reset(delayMs / 1000);
        }
        setInterval(f, delayMs) {
            f();
            this.setTimeout(() => {
                this.setInterval(f, delayMs);
            }, delayMs);
        }
        // Initialize with the proper pattern
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => {
                this.onStart();
                print("Onstart event triggered");
            });
        }
        onStart() {
            this.instantiatePrefabs();
        }
        // Method to instantiate prefabs within the circle area
        instantiatePrefabs() {
            if (!this.center || !this.prefab) {
                print("Error: Center or prefab not assigned!");
                return;
            }
            const centerPosition = this.center.getTransform().getWorldPosition();
            for (let i = 0; i < this.numberOfPrefabs; i++) {
                // Random angle and distance to place the prefab
                const alpha = Math.random() * Math.PI * 2;
                const beta = Math.random() * Math.PI * 2;
                const distance = this.radius;
                // Calculate position based on angle and distance
                const randomPosition = new vec3(centerPosition.x + Math.sin(alpha) * Math.cos(beta) * distance, centerPosition.y + Math.sin(beta) * Math.sin(alpha) * distance, centerPosition.z + Math.cos(alpha) * distance);
                // Create a prefab instance at the random position
                const particle = this.createPrefabInstance(new vec3(randomPosition.x, randomPosition.y, randomPosition.z));
                const pWithPos = { obj: particle, pos: randomPosition };
                this.particles.push(pWithPos);
                this.startAnimation(pWithPos, i);
            }
        }
        startAnimation(particle, index) {
            const initialRatio = index / this.numberOfPrefabs;
            const initialDuration = this.animCycleMs * initialRatio;
            let transform = particle.obj.getTransform();
            let originalPosition = new vec3(particle.pos.x, particle.pos.y, particle.pos.z);
            let destinationPosition = originalPosition.add(new vec3(Math.random() * this.noiseAmplitude * initialRatio, Math.random() * this.noiseAmplitude * initialRatio, Math.random() * this.noiseAmplitude * initialRatio));
            LSTween_1.LSTween.moveFromToLocal(transform, originalPosition, destinationPosition, initialDuration).start();
            // Continue animation after n ms
            this.setTimeout(() => {
                this.setInterval(() => {
                    this.animateParticle(particle);
                }, this.animCycleMs);
            }, initialDuration);
        }
        animateParticle(particle) {
            let transform = particle.obj.getTransform();
            let startPosition = transform.getLocalPosition();
            let originalPosition = new vec3(particle.pos.x, particle.pos.y, particle.pos.z);
            let destinationPosition = originalPosition.add(new vec3(Math.random() * this.noiseAmplitude, Math.random() * this.noiseAmplitude, Math.random() * this.noiseAmplitude));
            LSTween_1.LSTween.moveFromToLocal(transform, startPosition, destinationPosition, this.animCycleMs).start();
        }
        // Helper method to create a prefab instance at a specific position
        createPrefabInstance(position) {
            if (this.prefab) {
                const instance = this.prefab.instantiate(this.sceneObject);
                instance.getTransform().setWorldPosition(position);
                return instance;
            }
        }
    };
    __setFunctionName(_classThis, "ParticleHive");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        ParticleHive = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return ParticleHive = _classThis;
})();
exports.ParticleHive = ParticleHive;
//# sourceMappingURL=ParticleHive.js.map