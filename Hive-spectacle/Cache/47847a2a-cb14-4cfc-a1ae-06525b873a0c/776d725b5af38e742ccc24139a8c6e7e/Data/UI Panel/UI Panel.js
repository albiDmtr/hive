// UI Panel.js
// Version: 2.0
// Event: On Awake
// Description: Panel that handles touch events for child UI widgets

// ----- USAGE -----
// Attach UI Widgets as direct children to UI Panel Scene Object.
// 
// ----- LOCAL API USAGE -----
// Valid Event Types: "onEnableInteractable", "onDisableInteractable"
//
// Manually enable interactable
// script.enableInteractable()
//
// Manually disable interactable
// script.disableInteractable()
//
// True if interactable
// script.isInteractable()
//
// Add callback function to event
// script.onEnableInteractable.add(callback)
// script.onDisableInteractable.add(callback)
//
// Remove callback function from event
// script.onEnableInteractable.remove(callback)
// script.onDisableInteractable.remove(callback)
//
// Enable touch events
// script.enableTouchEvents()
//
// Disable touch events
// script.disableTouchEvents()
//
// -----------------

//@input bool interactable = true
//@input int renderOrderOverride = 0 {"label" : "Render Order"}
//@ui {"widget":"separator"}
//@input bool editAdvancedOptions
//@ui {"widget":"group_start", "label":"Advanced Options", "showIf":"editAdvancedOptions"}
//@input bool printDebugStatements = false {"label": "Print Info"}
//@input bool printWarningStatements = true {"label": "Print Warnings"}
//@input bool disableTouchEventsInput = false {"label": "Disable Touch"}
//@input Asset.Material panelMaterial
//@ui {"widget":"group_end"}


// script modules
var events = require("Modules/EventModule");
var ui = require("Modules/UIWidgetsModule");
var DestructionHelper = require("Modules/DestructionHelper");
var manager = new DestructionHelper(script);

// events
var onEnableInteractable = new events.EventWrapper();
var onDisableInteractable = new events.EventWrapper();

var onTouchStart = new events.EventWrapper();
var onTouchMove = new events.EventWrapper();
var onTouchEnd = new events.EventWrapper();

// Local API
script.widgetType = ui.WidgetTypes.UIPanel;

script.enableInteractable = enableInteractable;
script.disableInteractable = disableInteractable;
script.isInteractable = isInteractable;
script.enableTouchEvents = enableTouchEvents;
script.disableTouchEvents = disableTouchEvents;
script.initialized = false;

script.ownerScript = null;

// touch api for control from parent widget
script.touchStart = touchStart;
script.touchEnd = touchEnd;
script.touchMove = touchMove;

// event wrappers to add callbacks from other scripts
script.onEnableInteractable = onEnableInteractable;
script.onDisableInteractable = onDisableInteractable;

script.allowTouchEvents = !script.disableTouchEventsInput;

script.acceptChildWidget = acceptChildWidget;
script.setOwner = setOwner;
script.notifyOnInitialize = notifyOnInitialize;

// Is this widget interactable?
var interactable = script.interactable;

// Stored touch events
var touchEventsHelper;

// Relevant Components
var thisScreenTransform = null;
var thisImage = null;

// Stores Objects containing information about each widget that this UIPanel controls
var nextWidgetID = 0;
var childWidgets = {};

var childListIsDirty = false;
var sortedChildList = [];

var sceneObject = script.getSceneObject();

var refreshHelper = new ui.RefreshHelper(initParams);

function refresh() {
    refreshHelper.requestRefresh();
}

refresh();


/**
 * @param {ScriptComponent} scriptComponent 
 */
function acceptChildWidget(scriptComponent) {
    var widgetType = scriptComponent.widgetType;
    if (!scriptComponent.owner && widgetType != null && widgetType >= 0) {
        ui.politeCall(scriptComponent, "setOwner", [script]);

        // Store its properties and identify it by the next id
        var id = nextWidgetID++;
        var child = scriptComponent.getSceneObject();

        var widgetInfo = {
            "sceneObject": child,
            "scriptComponent": scriptComponent,
            "widgetType": widgetType
        };

        if (childWidgets[id] == null) {
            childWidgets[id] = widgetInfo;
        }

        // If a UI Panel, disable its touch events so that this UI Panel controls its touch events
        if (widgetType == ui.WidgetTypes.UIPanel) {
            scriptComponent.disableTouchEvents();
        }

        if (!interactable) {
            scriptComponent.disableInteractable();
        }
        return true;
    }
}

function initializeTouches() {
    interactionComponent = getOrAddComponent(imageObject, "InteractionComponent");
    interactionComponent.onTouchStart.add(touchStart);
    interactionComponent.onTouchMove.add(touchMove);
    interactionComponent.onTouchEnd.add(touchEnd);
}

/**
 * Initialize all parameters
 */
function initParams() {
    if (script.initialized) {
        return;
    }
    if (!initPanel() ||
        !initInteractable() ||
        !initEvents()
    ) {
        return;
    }

    ui.answerPoliteCalls(script, "notifyOnInitialize");

    checkOwner();

    script.initialized = true;
}

/**
 * looks for the parent widget
 */
function seekOwner() {
    ui.findScriptUpwards(sceneObject, "acceptChildWidget", function (scr) {
        return scr.acceptChildWidget(script);
    });
}

/**
 * set script owner script
 * @param {ScriptComponent} ownerScript 
 */
function setOwner(ownerScript) {
    script.ownerScript = ownerScript;
    refresh();
}

/**
 * checks if owner script exists
 * @returns boolean
 */
function checkOwner() {
    if (!script.ownerScript) {
        seekOwner();
    }
    return !!script.ownerScript;
}
/**
 * 
 * @param {function} callback 
 */
function notifyOnInitialize(callback) {
    callback(script);
}

/**
 * Initialize Panel parameters
 * @returns boolean
 */
function initPanel() {
    thisScreenTransform = getOrAddComponent(sceneObject, "ScreenTransform");
    // Obtain this Scene Object's Image Component
    thisImage = sceneObject.getComponent("Image");
    if (!thisImage) {
        thisImage = manager.createComponent(sceneObject, "Image");
        thisImage.mainMaterial = script.panelMaterial;
    }
    thisImage.setRenderOrder(script.renderOrderOverride);
    return true;
}

/**
 * Initialize this Interactable
 * @returns boolean
 */
function initInteractable() {
    return true;
}

/**
 * Initialize events and behaviors
 * @returns boolean
 */
function initEvents() {
    if (script.allowTouchEvents) {
        enableTouchEvents();
    }
    return true;
}

/**
 * Disable Touch Events
 * @returns 
 */
function disableTouchEvents() {
    script.allowTouchEvents = false;
}
/**
 * Enable touch events
 */
function enableTouchEvents() {
    script.allowTouchEvents = true;
}

/**
 * Called when Touch has started
 * @param {TouchStartEventArgs} eventData 
 * @returns 
 */

function touchStart(eventData) {
    if (!interactable) {
        return;
    }
    onTouchStart.trigger(eventData);
}

/**
 * Called when Touch has ended
 * @param {TouchEndEventArgs} eventData 
 * @returns 
 */
function touchEnd(eventData) {
    if (!interactable) {
        return;
    }
    onTouchEnd.trigger(eventData);
}
/**
 *  Called when Touch has moved
 * @param {TouchMoveEventArgs} eventData 
 * @returns 
 */
function touchMove(eventData) {
    if (!interactable) {
        return;
    }
    onTouchMove.trigger(eventData);
}


/**
 * Return true if UI Panel is currently interactable, false otherwise
 * @returns boolean
 */
function isInteractable() {
    return interactable;
}

/**
* Disable this UI Panel and all UI widgets that it controls
*/
function disableInteractable() {
    if (!interactable) {
        return;
    }
    interactable = false;

    onDisableInteractable.trigger();

    for (var i in childWidgets) {
        var widget = childWidgets[i];
        widget.scriptComponent.disableInteractable();
    }
    printDebug("Disabled!");
}

/**
 * Enable this UI Panel and all UI widgets that it controls
 */
function enableInteractable() {
    if (interactable) {
        return;
    }
    interactable = true;
    onEnableInteractable.trigger();

    for (var i in childWidgets) {
        var widget = childWidgets[i];
        widget.scriptComponent.enableInteractable();
    }
    printDebug("Enabled!");
}

/**
 * returns first component of type or safely creates new one
 * @param {SceneObject} obj 
 * @param {keyof ComponentNameMap} componentType 
 * @returns 
 */
function getOrAddComponent(obj, componentType) {
    var component = obj.getComponent(componentType);
    if (isNull(component)) {
        printDebug(componentType + " component is not found, creating new" + componentType);
        return manager.createComponent(obj, componentType);
    }
    return component;
}

/**
 * Print debug messages
 * @param {any} message 
 */
function printDebug(message) {
    if (script.printDebugStatements) {
        print(sceneObject.name + " - " + message);
    }
}
/**
 * Print warning message
 * @param {any} message 
 */
function printWarning(message) {
    if (script.printWarningStatements) {
        print(sceneObject.name + " - WARNING, " + message);
    }
}