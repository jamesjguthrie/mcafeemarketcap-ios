#import "MMCommonDataReceiverViewController.h"
#import "MMWatchListUpdateProtocol.h"

@interface MMHomeViewController : MMCommonDataReceiverViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id<MMWatchListUpdateProtocol> watchListUpdateDelegate;

- (instancetype)initWithWatchList:(NSMutableArray *)watchList
                     cloudManager:(MMCloudManager *)cloudManager
                     themeManager:(MMThemeManager *)themeManager
                          nibName:(NSString *)nibNameOrNil
                           bundle:(NSBundle *)nibBundleOrNil;

@end
