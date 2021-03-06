#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CalculatorModel.h"

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

#define MOCKITO_SHORTHAND
#import "OCMockito/OCMockito.h"

@interface CalculatorModelTest : XCTestCase

@end

@implementation CalculatorModelTest {
	CalculatorModel *model;
}

-(void)setUp {
	model = [[CalculatorModel alloc] init];
}

- (void)touchButtonWithTag:(NSInteger)tag {
	id button = mock([UIButton class]);
	[given([button tag]) willReturnInteger:tag];
	[model buttonTouched:button];
}

- (void)testShouldStartWithValueZero {
	assertThat(model.currentValue, is(@"0"));
}

- (void)testShouldPostNotificationOnChanges {
	id notificationCenter = mock([NSNotificationCenter class]);
	model.notificationCenter = notificationCenter;
	[model buttonTouched:nil];
	[verify(notificationCenter) postNotificationName:ModelChangedNotification object:model];
}

- (void)testHasAlwaysNotificationCenter {
	assertThat(model.notificationCenter, is(notNilValue()));
}

- (void)testIgnoresLeadingZero {
	[self touchButtonWithTag:1];
	assertThat(model.currentValue, is(@"1"));
}

- (void)testAppendsButtonTouchesOnCurrentValue {
	[self touchButtonWithTag:1];
	[self touchButtonWithTag:2];
	assertThat(model.currentValue, is(@"12"));
}

- (void)testRestrictsInputTo12Numbers {
	model.currentValue = @"123456789012";
	[self touchButtonWithTag:3];
	assertThat(model.currentValue, is(@"123456789012"));
}

- (void)testUsesDecimalValuesWhenPeriodTouched {
	[self touchButtonWithTag:PeriodButton];
	assertThat(model.currentValue, is(@"0."));
}

- (void)testPeriodOnlyAppearsOnceWhenMultipleTimesTouched {
	[self touchButtonWithTag:PeriodButton];
	[self touchButtonWithTag:PeriodButton];
	assertThat(model.currentValue, is(@"0."));
}

- (void)testResetsModelAfterCleanButtonTouched {
	model.currentValue = @"17.42";
	[self touchButtonWithTag:CleanButton];
	assertThat(model.currentValue, is(@"0"));
}
@end
