#import "CalculatorModel.h"

NSString *ModelChangedNotification = @"ModelChangeNotification";
NSInteger PeriodButton = 10;
NSInteger EqualButton = 11;
NSInteger AddButton = 12;
NSInteger CleanButton = 19;

@implementation CalculatorModel {
	NSString *_accumulator;
	BOOL _willEnterNewNumber;
}

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
	if ([sender tag] == EqualButton) {
		self.currentValue = [@([self.currentValue floatValue] + [_accumulator floatValue]) stringValue];
		_willEnterNewNumber = YES;
	} else if ([sender tag] == AddButton) {
		_accumulator = self.currentValue;
		_willEnterNewNumber = YES;
	} else if ([sender tag] == CleanButton) {
		[self resetModel];
	} else if ([sender tag] == PeriodButton) {
		[self appendPeriod];
	} else if ([self isNumberButton:sender]) {
		[self appendNumber:sender];
	}
}

- (void)resetModel {
	self.currentValue = @"0";
	_willEnterNewNumber = NO;
}

- (BOOL)isNumberButton:(id)button {
	return [button tag] >=0 && [button tag] <=9;
}

- (void)appendNumber:(id)button {
	if (_willEnterNewNumber || [self.currentValue isEqualToString:@"0"]) {
		self.currentValue = [self valueForButton:button];
		_willEnterNewNumber = NO;
	} else if ([self.currentValue length] < 12) {
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
	return [NSString stringWithFormat:@"%ld", (long)[sender tag]];
}

-(NSNotificationCenter *)notificationCenter {
	return _notificationCenter? _notificationCenter : [NSNotificationCenter defaultCenter];
}
@end
