#import <UIKit/UIKit.h>
#import "MMCommonViewController.h"
#import "MMDataReceiverProtocol.h"


@interface MMViewController : MMCommonViewController

@property (strong, nonatomic) MMCloudManager *cloudManager;

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
                        themeManager:(MMThemeManager *)themeManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil;

@end
