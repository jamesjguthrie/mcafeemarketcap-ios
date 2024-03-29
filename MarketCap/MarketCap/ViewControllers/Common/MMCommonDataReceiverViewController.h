#import "MMCommonTabBarViewController.h"
#import "MMDataReceiverProtocol.h"

@interface MMCommonDataReceiverViewController : MMCommonTabBarViewController

@property (strong, nonatomic) MMCloudManager *cloudManager;

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
                        themeManager:(MMThemeManager *)themeManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil;

- (NSString *)urlString;

@end
