#import "UILabel+AccessibilityFix.h"


@implementation UILabel (AccessibilityFix)
@dynamic accessibilityValue;

-(NSString *)accessibilityValue {
    return self.text;
}
@end