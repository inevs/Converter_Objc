"use strict";

#import "env.js";
#import "lib/pages/Page.js"
#import "lib/pages/CalculatorPage.js"

test("Adding two numbers", function() {
    var calc = CalculatorPage;
    calc.enter("2")
    calc.enter("+")
    calc.enter("3")
    calc.enter("=")
    calc.assertDisplayShows("5")
})
