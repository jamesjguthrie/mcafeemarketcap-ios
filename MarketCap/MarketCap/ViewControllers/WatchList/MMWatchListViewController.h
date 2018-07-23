#import "MMCommonTabBarViewController.h"
#import "MMWatchListUpdateProtocol.h"

@interface MMWatchListViewController : MMCommonTabBarViewController<MMWatchListUpdateProtocol>

- (instancetype)initWithWatchList:(NSMutableArray *)watchList
                     themeManager:(MMThemeManager *)themeManager
                          nibName:(NSString *)nibNameOrNil
                           bundle:(NSBundle *)nibBundleOrNil;

@end
