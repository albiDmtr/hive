// ButtonWithCustomText.js
// This script creates a button with custom text and runs code when it is clicked.

//@input string buttonText = "Click Me!"

// Create a new SceneObject for the button
var buttonObject = global.scene.createSceneObject("CustomButton");

// Add a ScreenTransform to position the button on the screen
var screenTransform = buttonObject.createComponent("Component.ScreenTransform");

// Set the button's position and size (centered, adjust as needed)
screenTransform.anchors = Rect.create(-0.2, 0.2, -0.05, 0.05); // left, right, bottom, top

// Add a Text component for the button label
var textComponent = buttonObject.createComponent("Component.Text");
textComponent.text = script.buttonText;
textComponent.size = 48; // Font size
textComponent.sizeToFit = true;

// Optional: Style the button background
textComponent.backgroundSettings.enabled = true;
textComponent.backgroundSettings.cornerRadius = 0.1;
textComponent.backgroundSettings.fill.color = new vec4(0.2, 0.6, 1.0, 1.0); // Blue background

// Add an InteractionComponent to detect taps
var interaction = buttonObject.createComponent(
  "Component.InteractionComponent",
);

// Make sure the InteractionComponent is aware of the Text visual for hit detection
interaction.addMeshVisual(textComponent);

// Bind a function to the onTap event
interaction.onTap.add(function (eventData) {
  print("Button was clicked!");
  // Place your custom code here
  // For example, show a hint or trigger an animation
});

// Optionally, you can change the button's appearance when pressed
interaction.onTouchStart.add(function (eventData) {
  textComponent.backgroundSettings.fill.color = new vec4(0.1, 0.4, 0.8, 1.0); // Darker blue
});
interaction.onTouchEnd.add(function (eventData) {
  textComponent.backgroundSettings.fill.color = new vec4(0.2, 0.6, 1.0, 1.0); // Original color
});
