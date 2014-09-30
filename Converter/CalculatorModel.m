#import "CalculatorModel.h"

NSString *ModelChangedNotification = @"ModelChangeNotification";
NSInteger PeriodButton = 10;
NSInteger CleanButton = 19;

@implementation CalculatorModel

- (instancetype)init {
	self = [super init];
	if (self) {
		[self resetModel];
	}
	return self;
}

- (void)buttonTouched:(id)sender {
	[self updateModelForButton:sender];
	[self.notificationCenter postNotificationName:ModelChangedNotification object:self];
}

- (void)updateModelForButton:(id)sender {
	if ([sender tag] == CleanButton) {
		[self resetModel];
	} else if ([sender tag] == PeriodButton) {
		[self appendPeriod];
	} else if ([self isNumberButton:sender]) {
		[self appendNumber:sender];
	}
}

- (void)resetModel {
	self.currentValue = @"0";
}

- (BOOL)isNumberButton:(id)button {
	return [button tag] >=0 && [button tag] <=9;
}

- (void)appendNumber:(id)button {
	if ([self.currentValue isEqualToString:@"0"]) {
		self.currentValue = [self valueForButton:button];
	} else if ([self.currentValue length] < 8) {
		self.currentValue = [self appendString:[self valueForButton:button]];
	}
}

- (void)appendPeriod {
	if (![self.currentValue containsString:@"."]) {
		self.currentValue = [self appendString:@"."];
	}
}

- (NSString *)appendString:(NSString *)string {
	return [self.currentValue stringByAppendingString:string];
}

- (NSString *)valueForButton:(id)sender {
	return [NSString stringWithFormat:@"%ld", [sender tag]];
}

-(NSNotificationCenter *)notificationCenter {
	return _notificationCenter? _notificationCenter : [NSNotificationCenter defaultCenter];
}
@end
