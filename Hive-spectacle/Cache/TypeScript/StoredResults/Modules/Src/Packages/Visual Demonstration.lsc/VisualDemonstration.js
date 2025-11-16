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
exports.VisualDemonstration = void 0;
var __selfType = requireType("./VisualDemonstration");
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
const Event_1 = require("./Modules/Event/Event");
const BehaviorEventCallbacks_1 = require("./Modules/BehaviorSupport/BehaviorEventCallbacks");
var ShowType;
(function (ShowType) {
    ShowType[ShowType["OnFrontCamera"] = 0] = "OnFrontCamera";
    ShowType[ShowType["OnBackCamera"] = 1] = "OnBackCamera";
    ShowType[ShowType["OnBoth"] = 2] = "OnBoth";
})(ShowType || (ShowType = {}));
var HintType;
(function (HintType) {
    HintType[HintType["Text"] = 0] = "Text";
    HintType[HintType["Image"] = 1] = "Image";
    HintType[HintType["Mesh"] = 2] = "Mesh";
})(HintType || (HintType = {}));
let VisualDemonstration = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var VisualDemonstration = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.autostart = this.autostart;
            this.visualDemonstration = this.visualDemonstration;
            this.showType = this.showType;
            this.appearDelay = this.appearDelay;
            this.appearDuration = this.appearDuration;
            this.screenDuration = this.screenDuration;
            this.disappearDuration = this.disappearDuration;
            this.repeatCount = this.repeatCount;
            this.advanced = this.advanced;
            this.disableHiding = this.disableHiding;
            this.showOnce = this.showOnce;
            this.hideOnCapture = this.hideOnCapture;
            this.hideOnCameraSwitch = this.hideOnCameraSwitch;
            this.eventCallbacks = this.eventCallbacks;
            this.callbackType = this.callbackType;
            this.onVisualDemonstrationStartBehaviors = this.onVisualDemonstrationStartBehaviors;
            this.onVisualDemonstrationFinishBehaviors = this.onVisualDemonstrationFinishBehaviors;
            this.onVisualDemonstrationStartCustomTriggers = this.onVisualDemonstrationStartCustomTriggers;
            this.onVisualDemonstrationFinishCustomTriggers = this.onVisualDemonstrationFinishCustomTriggers;
            this.customFunctionScript = this.customFunctionScript;
            this.onVisualDemonstrationStartFunctions = this.onVisualDemonstrationStartFunctions;
            this.onVisualDemonstrationFinishFunctions = this.onVisualDemonstrationFinishFunctions;
            this.onVisualDemonstrationStart = new Event_1.Event();
            this.onVisualDemonstrationFinish = new Event_1.Event();
            this.component = null;
            this.pass = null;
            this.color = null;
            this.initAlpha = null;
            this.showCount = 0;
            this.frontCameraEvent = null;
            this.backCameraEvent = null;
            this.delayedHide = null;
            this.updateShowAnimationEvent = null;
            this.updateHideAnimationEvent = null;
            this.startTime = null;
            this.isShowAnimationPlaying = false;
            this.isHideAnimationPlaying = false;
            this.isShown = false;
        }
        __initialize() {
            super.__initialize();
            this.autostart = this.autostart;
            this.visualDemonstration = this.visualDemonstration;
            this.showType = this.showType;
            this.appearDelay = this.appearDelay;
            this.appearDuration = this.appearDuration;
            this.screenDuration = this.screenDuration;
            this.disappearDuration = this.disappearDuration;
            this.repeatCount = this.repeatCount;
            this.advanced = this.advanced;
            this.disableHiding = this.disableHiding;
            this.showOnce = this.showOnce;
            this.hideOnCapture = this.hideOnCapture;
            this.hideOnCameraSwitch = this.hideOnCameraSwitch;
            this.eventCallbacks = this.eventCallbacks;
            this.callbackType = this.callbackType;
            this.onVisualDemonstrationStartBehaviors = this.onVisualDemonstrationStartBehaviors;
            this.onVisualDemonstrationFinishBehaviors = this.onVisualDemonstrationFinishBehaviors;
            this.onVisualDemonstrationStartCustomTriggers = this.onVisualDemonstrationStartCustomTriggers;
            this.onVisualDemonstrationFinishCustomTriggers = this.onVisualDemonstrationFinishCustomTriggers;
            this.customFunctionScript = this.customFunctionScript;
            this.onVisualDemonstrationStartFunctions = this.onVisualDemonstrationStartFunctions;
            this.onVisualDemonstrationFinishFunctions = this.onVisualDemonstrationFinishFunctions;
            this.onVisualDemonstrationStart = new Event_1.Event();
            this.onVisualDemonstrationFinish = new Event_1.Event();
            this.component = null;
            this.pass = null;
            this.color = null;
            this.initAlpha = null;
            this.showCount = 0;
            this.frontCameraEvent = null;
            this.backCameraEvent = null;
            this.delayedHide = null;
            this.updateShowAnimationEvent = null;
            this.updateHideAnimationEvent = null;
            this.startTime = null;
            this.isShowAnimationPlaying = false;
            this.isHideAnimationPlaying = false;
            this.isShown = false;
        }
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
        forceHide() {
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
            if (!this.isShown || this.isShowAnimationPlaying || this.isHideAnimationPlaying)
                return;
            this.hideAnimation();
        }
        /*
        Initiates the appearance of the visual demonstration.
         */
        show() {
            if (this.isShowAnimationPlaying || this.isHideAnimationPlaying || this.isShown)
                return;
            this.showCount++;
            if (!this.component.enabled) {
                this.setAlpha(0.0);
                this.component.enabled = true;
            }
            if (this.hintType == HintType.Image || this.hintType == HintType.Mesh) {
                if (this.pass.baseTex) {
                    const provider = this.pass.baseTex.control;
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
        initializeEventCallbacks() {
            if (this.eventCallbacks && this.callbackType !== BehaviorEventCallbacks_1.CallbackType.None) {
                this.onVisualDemonstrationStart.add(BehaviorEventCallbacks_1.BehaviorEventCallbacks.invokeCallbackFromInputs(this, 'onVisualDemonstrationStart'));
                this.onVisualDemonstrationFinish.add(BehaviorEventCallbacks_1.BehaviorEventCallbacks.invokeCallbackFromInputs(this, 'onVisualDemonstrationFinish'));
            }
        }
        /**
         *  Initializes the visual demonstration.
         * @private
         */
        initializeVisualDemonstration() {
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
        initializeComponent() {
            switch (this.visualDemonstration.getTypeName()) {
                case 'Component.Text':
                    this.hintType = HintType.Text;
                    this.component = this.visualDemonstration;
                    break;
                case 'Component.RenderMeshVisual':
                    this.hintType = HintType.Mesh;
                    this.component = this.visualDemonstration;
                    break;
                case 'Component.Image':
                    this.hintType = HintType.Image;
                    this.component = this.visualDemonstration;
                    break;
            }
            this.initializeStartInformation();
            this.setAlpha(0);
        }
        /**
         *  Initializes the starting information for the visual demonstration.
         * @private
         */
        initializeStartInformation() {
            switch (this.hintType) {
                case HintType.Text:
                    this.pass = {
                        text: this.component.textFill,
                        outline: this.component.outlineSettings.fill,
                        dropshadow: this.component.dropshadowSettings.fill,
                        background: this.component.backgroundSettings.fill
                    };
                    this.color = {
                        text: this.pass.text.color,
                        outline: this.pass.outline.color,
                        dropshadow: this.pass.dropshadow.color,
                        background: this.pass.background.color
                    };
                    this.initAlpha = {
                        text: this.color.text.a,
                        outline: this.color.outline.a,
                        dropshadow: this.color.dropshadow.a,
                        background: this.color.background.a
                    };
                    break;
                case HintType.Image:
                    this.pass = this.component.mainPass;
                    this.color = (this.pass.baseColor);
                    this.initAlpha = this.color.a;
                    break;
                case HintType.Mesh:
                    this.pass = this.component.mainPass;
                    this.color = (this.pass.baseColor);
                    this.initAlpha = this.color.a;
                    break;
            }
        }
        /**
         *  Sets alpha for the visual demonstration component.
         * @private
         */
        setAlpha(value) {
            switch (this.hintType) {
                case HintType.Text:
                    const colorAsTextColor = this.color;
                    const passAsTextPass = this.pass;
                    const alphaAsTextAlpha = this.initAlpha;
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
                    this.color.a = this.initAlpha * value;
                    this.pass.baseColor = this.color;
            }
        }
        /**
         *  Hides the visual demonstration during photo capture and video recording.
         * @private
         */
        forceStopIfCapture() {
            const capture = this.createEvent('SnapImageCaptureEvent');
            const record = this.createEvent('SnapRecordStartEvent');
            capture.bind(() => this.forceHide());
            record.bind(() => this.forceHide());
        }
        /**
         *  Initializes camera events ans defines the visual demonstration behavior in relation to them.
         * @private
         */
        initializeCameraEvents() {
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
        callbackForTextureAnimation() {
            const delayedTextureAnimation = this.createEvent('DelayedCallbackEvent');
            delayedTextureAnimation.bind(() => {
                if (this.hintType == HintType.Image || this.hintType == HintType.Mesh) { //image or mesh
                    if (!this.pass.baseTex)
                        return;
                    const provider = this.pass.baseTex.control;
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
        createCallbackForHide() {
            this.delayedHide = this.createEvent('DelayedCallbackEvent');
            this.delayedHide.bind(() => this.hide());
        }
        /**
         * Creates a delayed event to initiate the animation of the visual demonstration appearance.
         * @private
         */
        showDelay() {
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
        showAnimation() {
            this.startTime = getTime();
            this.isShowAnimationPlaying = true;
            this.onVisualDemonstrationStart.trigger();
            this.updateShowAnimationEvent.enabled = true;
        }
        /**
         * Starts the disappearance animation
         * @private
         */
        hideAnimation() {
            this.startTime = getTime();
            this.isHideAnimationPlaying = true;
            this.updateHideAnimationEvent.enabled = true;
        }
        /**
         * Invokes the function to show the visual demonstration based on input conditions.
         * @private
         */
        showHint() {
            if ((this.showOnce && this.showCount > 0) || !this.autostart)
                return;
            this.show();
        }
        /**
         * Initializes the UpdateEvent for the appearance animation.
         * @private
         */
        initializeShowAnimationEvent() {
            this.updateShowAnimationEvent = this.createEvent('UpdateEvent');
            this.updateShowAnimationEvent.enabled = false;
            this.updateShowAnimationEvent.bind(() => {
                if (getTime() - this.startTime < this.appearDuration) {
                    const animationPlayTime = (getTime() - this.startTime) / this.appearDuration;
                    this.setAlpha(animationPlayTime);
                }
                else {
                    this.setAlpha(1);
                    this.isShowAnimationPlaying = false;
                    this.isShown = true;
                    this.updateShowAnimationEvent.enabled = false;
                    if (!this.disableHiding)
                        this.delayedHide.reset(this.screenDuration);
                }
            });
        }
        /**
         * Initializes the UpdateEvent for the disappearance animation.
         * @private
         */
        initializeHideAnimationEvent() {
            this.updateHideAnimationEvent = this.createEvent('UpdateEvent');
            this.updateHideAnimationEvent.enabled = false;
            this.updateHideAnimationEvent.bind(() => {
                if (getTime() - this.startTime < this.disappearDuration) {
                    const animationPlayTime = (getTime() - this.startTime) / this.disappearDuration;
                    this.setAlpha(1.0 - animationPlayTime);
                }
                else {
                    this.setAlpha(0);
                    this.onVisualDemonstrationFinish.trigger();
                    this.isHideAnimationPlaying = false;
                    this.isShown = false;
                    this.updateHideAnimationEvent.enabled = false;
                }
            });
        }
    };
    __setFunctionName(_classThis, "VisualDemonstration");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        VisualDemonstration = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return VisualDemonstration = _classThis;
})();
exports.VisualDemonstration = VisualDemonstration;
//# sourceMappingURL=VisualDemonstration.js.map