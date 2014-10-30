#import <UIKit/UIKit.h>

extern NSString *ModelChangedNotification;
extern NSInteger PeriodButton;
extern NSInteger AddButton;
extern NSInteger EqualButton;
extern NSInteger CleanButton;

@interface CalculatorModel : NSObject

@property (nonatomic) NSNotificationCenter *notificationCenter;
@property (nonatomic) NSString *currentValue;

- (void)buttonTouched:(id)sender;

@end
