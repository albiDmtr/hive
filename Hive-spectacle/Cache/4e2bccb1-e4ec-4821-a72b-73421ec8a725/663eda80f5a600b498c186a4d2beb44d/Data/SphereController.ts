import { Snap3D } from "RemoteServiceGateway.lspkg/HostedSnap/Snap3D";
import { Snap3DTypes } from "RemoteServiceGateway.lspkg/HostedSnap/Snap3DTypes";

@component
export class SphereController extends BaseScriptComponent {
  private asrModule = require("LensStudio:AsrModule");
  private internetModule: InternetModule = require("LensStudio:InternetModule");

  public pointPositions: vec3[] = [new vec3(0, 1, 2)];
  onAwake() {
    this.createEvent("OnStartEvent").bind(() => {
      this.onStart();
      print("Onstart event triggered");
    });
  }

  onStart(): void {
    // Make mock HTTP request
    //this.makeRequest();
    //
    // 3d generation
    this.do3DGeneration();

    // Set up ASR and start transcribing
    /*const options = AsrModule.AsrTranscriptionOptions.create();
    options.silenceUntilTerminationMs = 1000;
    options.mode = AsrModule.AsrMode.HighAccuracy;
    options.onTranscriptionUpdateEvent.add((eventArgs) =>
      this.onTranscriptionUpdate(eventArgs),
    );
    options.onTranscriptionErrorEvent.add((eventArgs) =>
      print(`Transcription error: ${eventArgs}`),
    );*/

    //this.asrModule.startTranscribing(options);
  }

  private do3DGeneration() {
    print("Generating 3D model...");
    Snap3D.submitAndGetStatus({
      prompt: "A hotdog",
      format: "obj",
      refine: true,
      use_vertex_color: false,
    })
      .then((submitGetStatusResults) => {
        print(
          `[INFO] Received status: ${JSON.stringify(submitGetStatusResults)}`,
        );
        submitGetStatusResults.event.add(([value, assetOrError]) => {
          print(`[INFO] Received asset: ${value}`);
          if (value === "image") {
            let imageAsset = assetOrError as Snap3DTypes.TextureAssetData;
            //Apply imageAsset.texture;
          } else if (value === "base_mesh") {
            assetOrError = assetOrError as Snap3DTypes.GltfAssetData;
            this.extractVertices(assetOrError.gltfAsset);
          } else if (value === "refined_mesh") {
            print("Refined mesh arrived.");
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
        print("[ERROR] do3DGeneration: " + error);
      });
  }

  private safeStringify(obj: any): string {
    const seen = new WeakSet();
    return JSON.stringify(
      obj,
      (key, value) => {
        // Skip circular references and functions
        if (typeof value === "object" && value !== null) {
          if (seen.has(value)) {
            return "[Circular]";
          }
          seen.add(value);
        }
        if (typeof value === "function") {
          return "[Function]";
        }
        return value;
      },
      2,
    );
  }

  private extractVertices = (gltfAsset: GltfAsset) => {
    print(Object.keys(gltfAsset));
    print(Object.getOwnPropertyNames(gltfAsset));
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

  private onTranscriptionUpdate = (
    eventArgs: AsrModule.TranscriptionUpdateEvent,
  ) => {
    print(
      `onTranscriptionUpdateCallback text=${eventArgs.text}, isFinal=${eventArgs.isFinal}`,
    );
  };

  private stopSession(): void {
    this.asrModule.stopTranscribing();
  }
}
