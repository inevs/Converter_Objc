
#import <OCHamcrest/HCIsInstanceOf.h>
#import "HasTargetActionMatcher.h"


@implementation HasTargetActionMatcher {
	id _target;
	NSString *_action;
}

- (id)initWithTarget:(id)target action:(NSString *)action {
	self = [super init];
	if (self) {
		_target = target;
		_action = action;
	}
	return self;
}


- (BOOL)matches:(id)item {
	if ([item isKindOfClass:[UIControl class]]) {
		NSArray *actions = [item actionsForTarget:_target forControlEvent:UIControlEventTouchUpInside];
		return [actions containsObject:_action];
	}
	return NO;
}

- (void)describeTo:(id <HCDescription>)description {
	NSString *message = [NSString stringWithFormat:@"button expected to have action %@ on target %@", _action, _target];
	[description appendText:message];
}


@end

id hasTargetAndAction(id target, NSString *action) {
	return [[HasTargetActionMatcher alloc] initWithTarget:target action:action];
}