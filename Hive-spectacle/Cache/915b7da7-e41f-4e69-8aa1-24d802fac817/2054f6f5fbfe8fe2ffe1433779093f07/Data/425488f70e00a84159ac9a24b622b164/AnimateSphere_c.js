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
// @input SceneObject center {"hint":"Center of the circle area"}
// @input Asset.ObjectPrefab prefab {"hint":"Prefab to instantiate"}
// @input float numberOfPrefabs = 10 {"hint":"Number of prefabs to instantiate"}
// @input float radius = 5 {"hint":"Radius of the circle"}
// @input Asset.InternetModule internetModule
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../Modules/Src/Assets/AnimateSphere");
Object.setPrototypeOf(script, Module.CircleAreaInstantiatorTS.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("center", []);
    checkUndefined("prefab", []);
    checkUndefined("numberOfPrefabs", []);
    checkUndefined("radius", []);
    checkUndefined("internetModule", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
