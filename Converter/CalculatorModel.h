#import <UIKit/UIKit.h>

extern NSString *ModelChangedNotification;

@interface CalculatorModel : NSObject

@property (nonatomic) NSNotificationCenter *notificationCenter;
@property (nonatomic) NSString *currentValue;

- (void)buttonTouched:(id)sender;

@end
