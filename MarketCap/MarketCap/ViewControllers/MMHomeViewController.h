#import <UIKit/UIKit.h>
#import "MMViewController.h"
#import "MMCloudManager.h"

@interface MMHomeViewController : MMViewController <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil;

@end
