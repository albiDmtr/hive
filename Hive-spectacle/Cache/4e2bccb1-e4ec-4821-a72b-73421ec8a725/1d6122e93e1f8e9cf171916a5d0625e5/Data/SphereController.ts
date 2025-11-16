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
}
