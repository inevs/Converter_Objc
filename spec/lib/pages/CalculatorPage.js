"use strict"

var CalculatorPage = {
	enter: function(value) {
		this.window().buttons().firstWithName(value).tap()
	},

	assertDisplayShows: function(value) {
		var label = this.window().elements().firstWithPredicate("name='DisplayLabel'")
		var text = label.value()
		assertEqual(text, value)
	}

}

CalculatorPage.__proto__ = Page;
