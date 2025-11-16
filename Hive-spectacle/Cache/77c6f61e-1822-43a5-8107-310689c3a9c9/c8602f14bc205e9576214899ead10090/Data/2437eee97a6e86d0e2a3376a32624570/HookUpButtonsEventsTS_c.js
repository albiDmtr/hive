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
// @input Asset.ObjectPrefab prefabToInstantiate {"hint":"The prefab object we will instantiate when clicking the create button"}
// @input SceneObject destinationReference {"hint":"The position reference the object will move to on left-hand pinch"}
// @input AssignableType createButton {"hint":"The button that will create the prefab object"}
// @input float destroyDelay = 5 {"hint":"The delay time in seconds before the instantiated object is destroyed"}
// @input float lerpSpeed = 0.1 {"hint":"Speed at which the object moves to the destination on pinch"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/HookUpButtonsEventsTS");
Object.setPrototypeOf(script, Module.ExampleLensManager.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("destroyDelay", []);
    checkUndefined("lerpSpeed", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
