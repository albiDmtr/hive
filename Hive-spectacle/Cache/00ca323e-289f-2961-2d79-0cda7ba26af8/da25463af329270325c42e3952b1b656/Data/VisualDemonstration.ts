// VisualDemonstration.ts
// Version: 1.0.0
// Event: On Awake
// Description: Provides controls for setting up different kings of hints in the lens.
//
// API:
// show(): void - manually starts the appearance animation.
// hide(): void - manually starts the disappearance animation.
// forceHide(): void - manually turns off the visual demonstration without animation.
// visible: boolean - returns whether the visual demonstration is active at the moment.
//
// Events:
// onVisualDemonstrationStart - triggers when the appearance animation started.
// onVisualDemonstrationFinish - triggers when the disappearance animation ended.

import { Event } from './Modules/Event/Event';
import { BehaviorEventCallbacks, CallbackType } from './Modules/BehaviorSupport/BehaviorEventCallbacks';

enum ShowType{
    OnFrontCamera = 0,
    OnBackCamera = 1,
    OnBoth = 2
}

enum HintType{
    Text= 0,
    Image = 1,
    Mesh = 2
}

interface TextPassI {
    text: TextFill,
    outline: TextFill,
    dropshadow: TextFill,
    background: TextFill
}

interface TextColorI {
    text: vec4,
    outline: vec4,
    dropshadow: vec4,
    background: vec4
}

interface TextAlphaI {
    text: number,
    outline: number,
    dropshadow: number,
    background: number
}

type VisualPass = Pass | TextPassI;
type VisualColor = vec4 | TextColorI;
type VisualInitAlpha = number | TextAlphaI;
type VisualComponent = Text | RenderMeshVisual | Image;

@component
export class VisualDemonstration extends BaseScriptComponent {

    @input
    private autostart: boolean = true;

    @input
    @allowUndefined
    private visualDemonstration: BaseMeshVisual;

    @input('int', '0')
    @label('Show Type')
    @widget(new ComboBoxWidget()
        .addItem('On Front Camera', 0)
        .addItem('On Back Camera', 1)
        .addItem('On Both', 2))
    private showType: ShowType;

    @ui.group_start('Duration')

    @input('float', '0')
    @label('Delay')
    private appearDelay: number;

    @input('float', '0.8')
    @label('Fade In')
    private appearDuration: number;

    @input('float', '2.0')
    @label('Shown Time')
    private screenDuration: number;

    @input('float', '0.8')
    @label('Fade Out')
    private disappearDuration: number;

    @input('int', '3')
    @label('Animation Loops')
    private repeatCount: number = 3;

    @ui.group_end

    @input
    private advanced: boolean = false;

    @ui.group_start('Settings')
    @showIf('advanced')

    @input
    private disableHiding: boolean = false;

    @input
    private showOnce: boolean = false;

    @input
    private hideOnCapture: boolean = true;

    @input
    private hideOnCameraSwitch: boolean = true;

    @ui.separator

    @input
    private eventCallbacks: boolean;

    @ui.group_start('Event Callbacks')
    @showIf('eventCallbacks')

    @input('int', '0')
    @widget(new ComboBoxWidget()
        .addItem('None', 0)
        .addItem('Behavior Script', 1)
        .addItem('Behavior Custom', 2)
        .addItem('Custom Function', 3))
    private callbackType: CallbackType;

    @input
    @showIf('callbackType', 1)
    private onVisualDemonstrationStartBehaviors: ScriptComponent[];

    @input
    @showIf('callbackType', 1)
    private onVisualDemonstrationFinishBehaviors: ScriptComponent[];

    @input
    @showIf('callbackType', 2)
    private onVisualDemonstrationStartCustomTriggers: string[];

    @input
    @showIf('callbackType', 2)
    private onVisualDemonstrationFinishCustomTriggers: string[];


    @input
    @showIf("callbackType", 3)
    @allowUndefined
    private customFunctionScript: ScriptComponent;

    @input
    @showIf('callbackType', 3)
    @allowUndefined
    private onVisualDemonstrationStartFunctions: string[];

    @input
    @showIf('callbackType', 3)
    @allowUndefined
    private onVisualDemonstrationFinishFunctions: string[];

    @ui.group_end
    @ui.group_end

        onVisualDemonstrationStart: Event = new Event();
    onVisualDemonstrationFinish: Event = new Event();
    private component: VisualComponent = null;
    private pass: VisualPass = null;
    private color: VisualColor = null;
    private initAlpha: VisualInitAlpha = null;
    private showCount: number = 0;
    private frontCameraEvent: CameraFrontEvent = null;
    private backCameraEvent: CameraBackEvent = null;
    private delayedHide: DelayedCallbackEvent = null;
    private updateShowAnimationEvent: UpdateEvent = null;
    private updateHideAnimationEvent: UpdateEvent = null;
    private startTime: number = null;
    private isShowAnimationPlaying: boolean = false;
    private isHideAnimationPlaying: boolean = false;
    private isShown: boolean = false;
    private hintType: HintType;

    onAwake() {
        if (isNull(this.visualDemonstration)) {
            print("Error! Visual Demonstration input is missing.");
            return;
        }
        this.initializeEventCallbacks();
        this.initializeVisualDemonstration();
        this.initializeShowAnimationEvent();
        this.initializeHideAnimationEvent();
        this.initializeCameraEvents();
    }
    get visible() {
        return this.isShowAnimationPlaying || this.isShown;
    }

    /*
     * Forcibly hides the visual demonstration without animation.
     */
    forceHide(): void {
        this.component.enabled = false;
        this.updateShowAnimationEvent.enabled = false;
        this.updateHideAnimationEvent.enabled = false;
        this.setAlpha(0.0);
        this.isShown = false;
        this.isHideAnimationPlaying = false;
        this.isShowAnimationPlaying = false;
        this.onVisualDemonstrationFinish.trigger();
    }
    /*
    Initiates the disappearance of the visual demonstration.
     */
    hide() {
        if (!this.isShown || this.isShowAnimationPlaying || this.isHideAnimationPlaying) return;
        this.hideAnimation();
    }
    /*
    Initiates the appearance of the visual demonstration.
     */

    show() {
        if (this.isShowAnimationPlaying || this.isHideAnimationPlaying || this.isShown) return;
        this.showCount++;
        if (!this.component.enabled) {
            this.setAlpha(0.0);
            this.component.enabled = true;
        }
        if (this.hintType == HintType.Image || this.hintType == HintType.Mesh) {
            if ((this.pass as Pass).baseTex) {
                const provider = (this.pass as Pass).baseTex.control as AnimatedTextureFileProvider;
                if (provider.isOfType('Provider.AnimatedTextureFileProvider')) {
                    provider.pauseAtFrame(0);
                }
            }
        }
        this.callbackForTextureAnimation();
        this.showDelay();
    }
    /**
     * Adds listeners to `onTooltipStart` and `onTooltipFinish` events.
     * @private
     */
    private initializeEventCallbacks(): void {
        if (this.eventCallbacks && this.callbackType !== CallbackType.None) {
            this.onVisualDemonstrationStart.add(BehaviorEventCallbacks.invokeCallbackFromInputs(this, 'onVisualDemonstrationStart'));
            this.onVisualDemonstrationFinish.add(BehaviorEventCallbacks.invokeCallbackFromInputs(this, 'onVisualDemonstrationFinish'));
        }
    }

    /**
     *  Initializes the visual demonstration.
     * @private
     */

    private initializeVisualDemonstration(): void {
        this.initializeComponent();
        if (this.hideOnCapture) {
            this.forceStopIfCapture();
        }
        if (!this.disableHiding) {
            this.createCallbackForHide();
        }
    }
    /**
     *  Initializes the component of the visual demonstration.
     * @private
     */
    private initializeComponent(): void {
        switch (this.visualDemonstration.getTypeName()) {
            case 'Component.Text':
                this.hintType = HintType.Text;
                this.component = this.visualDemonstration as Text;
                break;
            case 'Component.RenderMeshVisual':
                this.hintType = HintType.Mesh;
                this.component = this.visualDemonstration as RenderMeshVisual;
                break;
            case 'Component.Image':
                this.hintType = HintType.Image;
                this.component = this.visualDemonstration as Image;
                break;
        }
        this.initializeStartInformation();
        this.setAlpha(0);
    }

    /**
     *  Initializes the starting information for the visual demonstration.
     * @private
     */

    private initializeStartInformation(): void {
        switch (this.hintType) {
            case HintType.Text:
                this.pass = {
                    text: (this.component as Text).textFill,
                    outline: (this.component as Text).outlineSettings.fill,
                    dropshadow: (this.component as Text).dropshadowSettings.fill,
                    background: (this.component as Text).backgroundSettings.fill
                } as TextPassI;
                this.color = {
                    text: this.pass.text.color,
                    outline: this.pass.outline.color,
                    dropshadow: this.pass.dropshadow.color,
                    background: this.pass.background.color
                } as TextColorI;
                this.initAlpha = {
                    text: this.color.text.a,
                    outline: this.color.outline.a,
                    dropshadow: this.color.dropshadow.a,
                    background: this.color.background.a
                } as TextAlphaI;
                break;
            case HintType.Image:
                this.pass = (this.component as Image).mainPass as Pass;
                this.color = (this.pass.baseColor) as vec4;
                this.initAlpha = this.color.a as number;
                break;
            case HintType.Mesh:
                this.pass = (this.component as RenderMeshVisual).mainPass as Pass;
                this.color = (this.pass.baseColor) as vec4;
                this.initAlpha = this.color.a as number;
                break;
        }
    }
    /**
     *  Sets alpha for the visual demonstration component.
     * @private
     */
    private setAlpha(value: number): void {
        switch (this.hintType) {
            case HintType.Text:
                const colorAsTextColor: TextColorI = this.color as TextColorI;
                const passAsTextPass: TextPassI = this.pass as TextPassI;
                const alphaAsTextAlpha: TextAlphaI = this.initAlpha as TextAlphaI;

                colorAsTextColor.text.a = alphaAsTextAlpha.text * value;
                colorAsTextColor.outline.a = alphaAsTextAlpha.outline * value;
                colorAsTextColor.dropshadow.a = alphaAsTextAlpha.dropshadow * value;
                colorAsTextColor.background.a = alphaAsTextAlpha.background * value;

                passAsTextPass.text.color = colorAsTextColor.text;
                passAsTextPass.outline.color = colorAsTextColor.outline;
                passAsTextPass.dropshadow.color = colorAsTextColor.dropshadow;
                passAsTextPass.background.color = colorAsTextColor.background;
                break;
            default:
                (this.color as vec4).a = (this.initAlpha as number) * value;
                (this.pass as Pass).baseColor = this.color as vec4;
        }
    }
    /**
     *  Hides the visual demonstration during photo capture and video recording.
     * @private
     */

    private forceStopIfCapture(): void {
        const capture = this.createEvent('SnapImageCaptureEvent');
        const record = this.createEvent('SnapRecordStartEvent');
        capture.bind(() => this.forceHide());
        record.bind(() => this.forceHide());
    }

    /**
     *  Initializes camera events ans defines the visual demonstration behavior in relation to them.
     * @private
     */

    private initializeCameraEvents(): void {
        this.frontCameraEvent = this.createEvent('CameraFrontEvent');
        this.backCameraEvent = this.createEvent('CameraBackEvent');

        switch (this.showType) {
            case ShowType.OnFrontCamera:
                this.frontCameraEvent.bind(() => this.showHint());
                if (this.hideOnCameraSwitch) {
                    this.backCameraEvent.bind(() => this.forceHide());
                }
                break;
            case ShowType.OnBackCamera:
                this.backCameraEvent.bind(() => this.showHint());
                if (this.hideOnCameraSwitch) {
                    this.frontCameraEvent.bind(() => this.forceHide());
                }
                break;
            case ShowType.OnBoth:
                this.frontCameraEvent.bind(() => this.showHint());
                this.backCameraEvent.bind(() => this.showHint());
                break;
        }
    }

    /**
     * Triggers the texture animation with a delay if the animated texture is present.
     * @private
     */

    private callbackForTextureAnimation(): void {
        const delayedTextureAnimation = this.createEvent('DelayedCallbackEvent');
        delayedTextureAnimation.bind(() => {
            if (this.hintType == HintType.Image || this.hintType == HintType.Mesh) { //image or mesh
                if (!(this.pass as Pass).baseTex) return;
                const provider = (this.pass as Pass).baseTex.control as AnimatedTextureFileProvider;
                if (provider.isOfType('Provider.AnimatedTextureFileProvider')) {
                    provider.play(this.repeatCount, 0);
                }
            }
            this.removeEvent(delayedTextureAnimation);
        });
        delayedTextureAnimation.reset(this.appearDelay);
    }

    /**
     * Creates a delayed event to initiate the animation of the visual demonstration disappearance.
     * @private
     */

    private createCallbackForHide(): void {
        this.delayedHide = this.createEvent('DelayedCallbackEvent');
        this.delayedHide.bind(() => this.hide());
    }

    /**
     * Creates a delayed event to initiate the animation of the visual demonstration appearance.
     * @private
     */

    private showDelay(): void {
        const delay = this.createEvent('DelayedCallbackEvent');
        delay.bind(() => {
            this.showAnimation();
            this.removeEvent(delay);
        });
        delay.reset(this.appearDelay);
    }

    /**
     * Starts the appearance animation
     * @private
     */

    private showAnimation(): void {
        this.startTime = getTime();
        this.isShowAnimationPlaying = true;
        this.onVisualDemonstrationStart.trigger();
        this.updateShowAnimationEvent.enabled = true;
    }
    /**
     * Starts the disappearance animation
     * @private
     */

    private hideAnimation(): void {
        this.startTime = getTime();
        this.isHideAnimationPlaying = true;
        this.updateHideAnimationEvent.enabled = true;
    }
    /**
     * Invokes the function to show the visual demonstration based on input conditions.
     * @private
     */

    private showHint(): void {
        if ((this.showOnce && this.showCount > 0) || !this.autostart) return;
        this.show();
    }

    /**
     * Initializes the UpdateEvent for the appearance animation.
     * @private
     */

    private initializeShowAnimationEvent(): void {
        this.updateShowAnimationEvent = this.createEvent('UpdateEvent');
        this.updateShowAnimationEvent.enabled = false;
        this.updateShowAnimationEvent.bind(() => {
            if (getTime() - this.startTime < this.appearDuration) {
                const animationPlayTime = (getTime() - this.startTime) / this.appearDuration;
                this.setAlpha(animationPlayTime);
            } else {
                this.setAlpha(1);
                this.isShowAnimationPlaying = false;
                this.isShown = true;
                this.updateShowAnimationEvent.enabled = false;
                if (!this.disableHiding) this.delayedHide.reset(this.screenDuration);
            }
        });
    }
    /**
     * Initializes the UpdateEvent for the disappearance animation.
     * @private
     */
    private initializeHideAnimationEvent(): void {
        this.updateHideAnimationEvent = this.createEvent('UpdateEvent');
        this.updateHideAnimationEvent.enabled = false;
        this.updateHideAnimationEvent.bind(() => {
            if (getTime() - this.startTime < this.disappearDuration) {
                const animationPlayTime = (getTime() - this.startTime) / this.disappearDuration;
                this.setAlpha(1.0 - animationPlayTime);
            } else {
                this.setAlpha(0);
                this.onVisualDemonstrationFinish.trigger();
                this.isHideAnimationPlaying = false;
                this.isShown = false;
                this.updateHideAnimationEvent.enabled = false;
            }
        });
    }
}
