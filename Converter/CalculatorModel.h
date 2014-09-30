#import <UIKit/UIKit.h>

extern NSString *ModelChangedNotification;

@interface CalculatorModel : NSObject

@property (nonatomic) NSNotificationCenter *notificationCenter;
@property (nonatomic) NSNumber *currentValue;

- (void)buttonTouched:(id)sender;

@end
