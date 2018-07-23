#import "MMCommonTabBarViewController.h"

@interface MMWatchListViewController : MMCommonTabBarViewController

- (instancetype)initWithWatchList:(NSMutableArray *)watchList
                     themeManager:(MMThemeManager *)themeManager
                          nibName:(NSString *)nibNameOrNil
                           bundle:(NSBundle *)nibBundleOrNil;

@end
