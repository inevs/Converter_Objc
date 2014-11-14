#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CurrencyRateUpdater.h"

@interface CurrencyRateUpdaterTest : XCTestCase <CurrencyRateUpdaterDelegate>

@end

@implementation CurrencyRateUpdaterTest {
	XCTestExpectation *expectation;
}

- (void)testShouldInformDelegateAboutRetrievingRates {
	expectation = [self expectationWithDescription:@"currency rate converted"];
	
	CurrencyRateUpdater *updater = [[CurrencyRateUpdater alloc] init];
	updater.delegate = self;
	[updater updateConversionRateForCurrencyFromEuroTo:@"USD"];
	[self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)currencyRateUpdater:(CurrencyRateUpdater *)updater didUpdateRate:(NSNumber *)rate forCurrency:(NSString *)isoCode {
	[expectation fulfill];
}

@end
