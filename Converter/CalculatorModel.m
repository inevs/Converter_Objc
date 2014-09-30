#import "CalculatorModel.h"

NSString *ModelChangedNotification = @"ModelChangeNotification";

@implementation CalculatorModel

- (instancetype)init {
	self = [super init];
	if (self) {
		_currentValue = @0.0;
	}
	return self;
}

- (void)buttonTouched:(id)sender {
	if ([self.currentValue integerValue] < 10000000) {
		self.currentValue = @([self.currentValue integerValue] * 10 + [sender tag]);
		[self.notificationCenter postNotificationName:ModelChangedNotification object:self];
	}
}

-(NSNotificationCenter *)notificationCenter {
	return _notificationCenter? _notificationCenter : [NSNotificationCenter defaultCenter];
}
@end
