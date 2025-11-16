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

  createImage(prompt: string) {
    this.spinner.enabled = true;
    this.textDisplay.text = "Generating: " + prompt;
    this.imageGenerator
      .generateImage(prompt)
      .then((image) => {
        print("Image generated successfully: " + image);
        this.textDisplay.text = prompt;
        this.image.mainMaterial.mainPass.baseTex = image;
        this.textDisplay.text = prompt;
        this.spinner.enabled = false;
      })
      .catch((error) => {
        print("Error generating image: " + error);
        this.textDisplay.text = "Error Generating Image";
        this.spinner.enabled = false;
      });
  }
}
