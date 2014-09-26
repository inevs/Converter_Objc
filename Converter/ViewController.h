#import <UIKit/UIKit.h>

extern NSInteger NumberPadTag;

@class CalculatorModel;

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (nonatomic) CalculatorModel *model;
@property (nonatomic) NSNotificationCenter *notificationCenter;

- (IBAction)buttonTouched:(id)sender;

@end

