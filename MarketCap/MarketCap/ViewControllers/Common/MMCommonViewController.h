#import <UIKit/UIKit.h>
#import "MMThemeManager.h"

@interface MMCommonViewController : UIViewController

@property (strong, nonatomic) MMThemeManager *themeManager;

- (instancetype)initWithThemeManager:(MMThemeManager *)themeManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil;
- (void)updateTheme;

@end
