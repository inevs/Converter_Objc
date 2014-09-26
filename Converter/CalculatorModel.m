#import "CalculatorModel.h"

NSString *ModelChangedNotification = @"ModelChangeNotification";

@implementation CalculatorModel

- (void)buttonTouched:(id)sender {
	[[NSNotificationCenter defaultCenter] postNotificationName:ModelChangedNotification object:self];
}

- (NSNumber *)currentValue {
	return [NSDecimalNumber numberWithDouble:0];
}

@end
