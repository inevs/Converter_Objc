#import "CalculatorModel.h"

NSString *ModelChangedNotification = @"ModelChangeNotification";

@implementation CalculatorModel

- (instancetype)init {
	self = [super init];
	if (self) {
		_currentValue = @"0";
	}
	return self;
}

- (void)buttonTouched:(id)sender {
	if ([self.currentValue isEqualToString:@"0"]) {
		self.currentValue = [NSString stringWithFormat:@"%ld", [sender tag]];
	} else if ([self.currentValue length] < 8) {
		self.currentValue = [self appendValue:[sender tag]];
	}
	[self.notificationCenter postNotificationName:ModelChangedNotification object:self];
}

- (NSString *)appendValue:(NSUInteger)value {
	return [NSString stringWithFormat:@"%@%ld", self.currentValue, value];
}

-(NSNotificationCenter *)notificationCenter {
	return _notificationCenter? _notificationCenter : [NSNotificationCenter defaultCenter];
}
@end
