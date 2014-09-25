#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "HasTargetActionMatcher.h"

#define HC_SHORTHAND
static const NSInteger NumberPadTag = 200;

#import "OCHamcrest/OCHamcrest.h"


@interface NumberpadTest : XCTestCase

@end

@implementation NumberpadTest {
	ViewController *_viewController;
}

- (void)setUp {
	UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[ViewController class]]];
	_viewController = [storyBoard instantiateInitialViewController];
}

- (void)testButton0HasTargetActionApplied {
	UIView *numberpad = [_viewController.view viewWithTag:NumberPadTag];
	for (int tag = 0; tag < 20; tag++) {
		UIButton *button = (UIButton *) [numberpad viewWithTag:tag];
		assertThat(button, hasTargetAndAction(_viewController, @"buttonTouched:"));
	}
}

@end
