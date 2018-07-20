#import <UIKit/UIKit.h>
#import "MMDataReceiverProtocol.h"
#import "MMThemeManager.h"

@interface MMViewController : UIViewController

@property (strong, nonatomic) MMCloudManager *cloudManager;
@property (strong, nonatomic) MMThemeManager *themeManager;

- (instancetype)initWithThemeManager:(MMThemeManager *)themeManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil;

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
                        themeManager:(MMThemeManager *)themeManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil;

@end
