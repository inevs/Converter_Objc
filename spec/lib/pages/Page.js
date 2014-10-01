"use strict"

var Page = {
    target: function() {
        return UIATarget.localTarget()
    },

    app: function() {
        return this.target().frontMostApp()
    },

    window: function() {
        return this.app().mainWindow()
    }
}

