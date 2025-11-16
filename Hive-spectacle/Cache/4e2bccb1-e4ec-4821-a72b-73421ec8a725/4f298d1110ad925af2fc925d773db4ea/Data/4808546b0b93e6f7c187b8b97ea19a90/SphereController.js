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
exports.SphereController = void 0;
var __selfType = requireType("./SphereController");
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
const Snap3D_1 = require("RemoteServiceGateway.lspkg/HostedSnap/Snap3D");
let SphereController = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var SphereController = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.asrModule = require("LensStudio:AsrModule");
            this.internetModule = require("LensStudio:InternetModule");
            this.pointPositions = [new vec3(0, 1, 2)];
            this.extractVertices = (gltfAsset) => {
                const gltf = typeof gltfAsset === "string" ? JSON.parse(gltfAsset) : gltfAsset;
                print(JSON.stringify(gltf));
            };
            /*private async makeRequest() {
              let request = new Request("https://httpbin.org/get", {
                method: "GET",
              });
          
              let response = await this.internetModule.fetch(request);
              if (response.status != 200) {
                print("Failure: response not successful");
                return;
              }
          
              let contentTypeHeader = response.headers.get("Content-Type");
              if (!contentTypeHeader.includes("application/json")) {
                print("Failure: wrong content type in response");
                return;
              }
          
              let responseJson = await response.json();
              print(responseJson);
            }*/
            this.onTranscriptionUpdate = (eventArgs) => {
                print(`onTranscriptionUpdateCallback text=${eventArgs.text}, isFinal=${eventArgs.isFinal}`);
            };
        }
        __initialize() {
            super.__initialize();
            this.asrModule = require("LensStudio:AsrModule");
            this.internetModule = require("LensStudio:InternetModule");
            this.pointPositions = [new vec3(0, 1, 2)];
            this.extractVertices = (gltfAsset) => {
                const gltf = typeof gltfAsset === "string" ? JSON.parse(gltfAsset) : gltfAsset;
                print(JSON.stringify(gltf));
            };
            /*private async makeRequest() {
              let request = new Request("https://httpbin.org/get", {
                method: "GET",
              });
          
              let response = await this.internetModule.fetch(request);
              if (response.status != 200) {
                print("Failure: response not successful");
                return;
              }
          
              let contentTypeHeader = response.headers.get("Content-Type");
              if (!contentTypeHeader.includes("application/json")) {
                print("Failure: wrong content type in response");
                return;
              }
          
              let responseJson = await response.json();
              print(responseJson);
            }*/
            this.onTranscriptionUpdate = (eventArgs) => {
                print(`onTranscriptionUpdateCallback text=${eventArgs.text}, isFinal=${eventArgs.isFinal}`);
            };
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => {
                this.onStart();
                print("Onstart event triggered");
            });
        }
        onStart() {
            // Make mock HTTP request
            //this.makeRequest();
            //
            // 3d generation
            this.do3DGeneration();
            // Set up ASR and start transcribing
            const options = AsrModule.AsrTranscriptionOptions.create();
            options.silenceUntilTerminationMs = 1000;
            options.mode = AsrModule.AsrMode.HighAccuracy;
            options.onTranscriptionUpdateEvent.add((eventArgs) => this.onTranscriptionUpdate(eventArgs));
            options.onTranscriptionErrorEvent.add((eventArgs) => print(`Transcription error: ${eventArgs}`));
            //this.asrModule.startTranscribing(options);
        }
        do3DGeneration() {
            print("Generating 3D model...");
            Snap3D_1.Snap3D.submitAndGetStatus({
                prompt: "A hotdog",
                format: "glb",
                refine: true,
                use_vertex_color: false,
            })
                .then((submitGetStatusResults) => {
                submitGetStatusResults.event.add(([value, assetOrError]) => {
                    if (value === "image") {
                        let imageAsset = assetOrError;
                        //Apply imageAsset.texture;
                    }
                    else if (value === "base_mesh") {
                        let gltfAsset = assetOrError;
                        this.extractVertices(gltfAsset);
                    }
                    else if (value === "refined_mesh") {
                        let gltfAsset = assetOrError;
                        this.extractVertices(gltfAsset);
                    }
                    else if (value === "failed") {
                        let error = assetOrError;
                        print("Error: " + error.errorMsg);
                    }
                });
            })
                .catch((error) => {
                print("Error: " + error);
            });
        }
        stopSession() {
            this.asrModule.stopTranscribing();
        }
    };
    __setFunctionName(_classThis, "SphereController");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        SphereController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return SphereController = _classThis;
})();
exports.SphereController = SphereController;
//# sourceMappingURL=SphereController.js.map