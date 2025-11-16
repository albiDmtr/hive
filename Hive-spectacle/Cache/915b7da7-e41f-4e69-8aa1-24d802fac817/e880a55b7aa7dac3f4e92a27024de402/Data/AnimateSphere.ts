import Easing from "LSTween.lspkg/TweenJS/Easing";
import { LSTween } from "LSTween.lspkg/LSTween";

@component
export class AnimateSphere extends BaseScriptComponent {
  onAwake() {
    let transform = this.getTransform();
    let startPosition = transform.getLocalPosition();
    let destinationPosition = startPosition.add(new vec3(50, 0, 0));
    LSTween.moveFromToLocal(
      this.getTransform(),
      startPosition,
      destinationPosition,
      1500
    )
      .easing(Easing.Linear.In)
      .delay(100) // There is a bug in TweenJS where the yoyo value will jump if no delay is set.
      .yoyo(true)
      .repeat(Infinity)
      .start();
  }
}
