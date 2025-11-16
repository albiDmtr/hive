@component
export class SphereController extends BaseScriptComponent {
  @input internetModule: InternetModule;

  public pointPositions: vec3[] = [];
  onAwake() {}
}
