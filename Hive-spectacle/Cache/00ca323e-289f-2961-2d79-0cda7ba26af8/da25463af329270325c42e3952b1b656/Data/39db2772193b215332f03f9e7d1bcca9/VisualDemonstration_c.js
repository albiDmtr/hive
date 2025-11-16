if (script.onAwake) {
    script.onAwake();
    return;
}
function checkUndefined(property, showIfData) {
    for (var i = 0; i < showIfData.length; i++) {
        if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]) {
            return;
        }
    }
    if (script[property] == undefined) {
        throw new Error("Input " + property + " was not provided for the object " + script.getSceneObject().name);
    }
}
// @input bool autostart = true
// @input Component.BaseMeshVisual visualDemonstration
// @input int showType = "0" {"label":"Show Type", "widget":"combobox", "values":[{"label":"On Front Camera", "value":0}, {"label":"On Back Camera", "value":1}, {"label":"On Both", "value":2}]}
// @ui {"widget":"group_start", "label":"Duration"}
// @input float appearDelay = "0" {"label":"Delay"}
// @input float appearDuration = "0.8" {"label":"Fade In"}
// @input float screenDuration = "2.0" {"label":"Shown Time"}
// @input float disappearDuration = "0.8" {"label":"Fade Out"}
// @input int repeatCount = "3" {"label":"Animation Loops"}
// @ui {"widget":"group_end"}
// @input bool advanced
// @ui {"widget":"group_start", "label":"Settings", "showIf":"advanced"}
// @input bool disableHiding
// @input bool showOnce
// @input bool hideOnCapture = true
// @input bool hideOnCameraSwitch = true
// @ui {"widget":"separator"}
// @input bool eventCallbacks
// @ui {"widget":"group_start", "label":"Event Callbacks", "showIf":"eventCallbacks"}
// @input int callbackType = "0" {"widget":"combobox", "values":[{"label":"None", "value":0}, {"label":"Behavior Script", "value":1}, {"label":"Behavior Custom", "value":2}, {"label":"Custom Function", "value":3}]}
// @input Component.ScriptComponent[] onVisualDemonstrationStartBehaviors {"showIf":"callbackType", "showIfValue":1}
// @input Component.ScriptComponent[] onVisualDemonstrationFinishBehaviors {"showIf":"callbackType", "showIfValue":1}
// @input string[] onVisualDemonstrationStartCustomTriggers {"showIf":"callbackType", "showIfValue":2}
// @input string[] onVisualDemonstrationFinishCustomTriggers {"showIf":"callbackType", "showIfValue":2}
// @input Component.ScriptComponent customFunctionScript {"showIf":"callbackType", "showIfValue":3}
// @input string[] onVisualDemonstrationStartFunctions {"showIf":"callbackType", "showIfValue":3}
// @input string[] onVisualDemonstrationFinishFunctions {"showIf":"callbackType", "showIfValue":3}
// @ui {"widget":"group_end"}
// @ui {"widget":"group_end"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../Modules/Src/Packages/Visual Demonstration.lsc/VisualDemonstration");
Object.setPrototypeOf(script, Module.VisualDemonstration.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("autostart", []);
    checkUndefined("showType", []);
    checkUndefined("appearDelay", []);
    checkUndefined("appearDuration", []);
    checkUndefined("screenDuration", []);
    checkUndefined("disappearDuration", []);
    checkUndefined("repeatCount", []);
    checkUndefined("advanced", []);
    checkUndefined("disableHiding", [["advanced",true]]);
    checkUndefined("showOnce", [["advanced",true]]);
    checkUndefined("hideOnCapture", [["advanced",true]]);
    checkUndefined("hideOnCameraSwitch", [["advanced",true]]);
    checkUndefined("eventCallbacks", [["advanced",true]]);
    checkUndefined("callbackType", [["advanced",true],["eventCallbacks",true]]);
    checkUndefined("onVisualDemonstrationStartBehaviors", [["advanced",true],["eventCallbacks",true],["callbackType",1]]);
    checkUndefined("onVisualDemonstrationFinishBehaviors", [["advanced",true],["eventCallbacks",true],["callbackType",1]]);
    checkUndefined("onVisualDemonstrationStartCustomTriggers", [["advanced",true],["eventCallbacks",true],["callbackType",2]]);
    checkUndefined("onVisualDemonstrationFinishCustomTriggers", [["advanced",true],["eventCallbacks",true],["callbackType",2]]);
    if (script.onAwake) {
       script.onAwake();
    }
});
