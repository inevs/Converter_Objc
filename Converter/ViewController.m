#import "ViewController.h"
#import "CalculatorModel.h"

NSInteger NumberPadTag = 200;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.notificationCenter addObserver:self selector:@selector(modelChanged) name:ModelChangedNotification object:self.model];
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self modelChanged];
}

- (NSNotificationCenter*)notificationCenter {
	if (!_notificationCenter) {
		_notificationCenter = [NSNotificationCenter defaultCenter];
	}
	return _notificationCenter;
}

- (CalculatorModel *)model {
	if (!_model) {
		_model = [[CalculatorModel alloc] init];
	}
	return _model;
}

- (IBAction)buttonTouched:(id)sender {
	[self.model buttonTouched:sender];
}

- (void)modelChanged {
	self.displayLabel.text = [NSString stringWithFormat:@"%@", self.model.currentValue];
}

@end
