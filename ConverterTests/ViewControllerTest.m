#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "HasTargetActionMatcher.h"
#import "CalculatorModel.h"

#define MOCKITO_SHORTHAND
#import "OCMockito/OCMockito.h"

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

@interface ViewController (Testing)
- (void)modelChanged;
@end

@interface ViewControllerTest : XCTestCase

@end

@implementation ViewControllerTest {
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

- (void)testDelegatesButtonTouchesToModel {
	id model = mock([CalculatorModel class]);
	_viewController.model = model;
	id button = mock([UIButton class]);
	[_viewController buttonTouched:button];
	[verify(model) buttonTouched:button];
}

- (void)testRegistersForModelChangeNotifications {
	id notificationCenter = mock([NSNotificationCenter class]);
	_viewController.notificationCenter = notificationCenter;
	[_viewController viewDidLoad];
	[verify(notificationCenter) addObserver:_viewController selector:@selector(modelChanged) name:ModelChangedNotification object:_viewController.model];
}

- (void)testUpdatesDisplayAfterModelChange {
	id label = mock([UILabel class]);
	_viewController.displayLabel = label;
	[_viewController modelChanged];
	[verify(label) setText:anything()];
}

@end
