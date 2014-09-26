#import <UIKit/UIKit.h>
#import "OCHamcrest/HCBaseMatcher.h"

@interface HasTargetActionMatcher : HCBaseMatcher
- (id)initWithTarget:(id)target action:(NSString *)action;
@end

FOUNDATION_EXPORT id hasTargetAndAction(id target, NSString *action);