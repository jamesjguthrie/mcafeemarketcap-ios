#import "MMCoinModel.h"

@protocol MMWatchListProtocol <NSObject>

- (void)addToWatchList:(MMCoinModel *)coin;
- (void)removeFromWatchList:(MMCoinModel *)coin;

@end


