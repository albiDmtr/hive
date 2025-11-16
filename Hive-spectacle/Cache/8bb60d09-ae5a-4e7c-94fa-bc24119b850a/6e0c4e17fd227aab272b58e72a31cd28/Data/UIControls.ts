@component
export class UIControls extends BaseScriptComponent {
  @ui.separator
  @ui.label("Example of using generative image APIs")
  @input
  @widget(
    new ComboBoxWidget([
      new ComboBoxItem("OpenAI", "OpenAI"),
      new ComboBoxItem("Gemini", "Gemini"),
    ]),
  )
  private modelProvider: string = "OpenAI";
  @ui.separator
  @input
  private textDisplay: Text;

  onAwake() {
    print("UIControls awake");
  }
}
