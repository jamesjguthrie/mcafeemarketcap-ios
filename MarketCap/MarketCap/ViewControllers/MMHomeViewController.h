#import "MMCommonDataReceiverViewController.h"
#import "MMWatchListUpdateProtocol.h"

@interface MMHomeViewController : MMCommonDataReceiverViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id<MMWatchListUpdateProtocol> watchListUpdateDelegate;

@end
