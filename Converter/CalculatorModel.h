#import <UIKit/UIKit.h>

extern NSString *ModelChangedNotification;

@interface CalculatorModel : NSObject

- (void)buttonTouched:(id)sender;
- (NSNumber *) currentValue;

@end
