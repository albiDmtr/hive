@component
export class SphereController extends BaseScriptComponent {
  @input internetModule: InternetModule;

  public pointPositions: vec3[] = [new vec3(0, 1, 2)];
  onAwake() {
    this.createEvent("OnStartEvent").bind(() => {
      this.onStart();
      print("Onstart event triggered");
    });
  }

  onStart(): void {
    print("hehe");
  }

  private makeRequest() {
    let request = new Request("[YOUR URL]", {
      method: "POST",
      body: JSON.stringify({ user: { name: "user", career: "developer" } }),
      headers: {
        "Content-Type": "application/json",
      },
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
    let username = responseJson.json["user"]["name"];
  }
}
