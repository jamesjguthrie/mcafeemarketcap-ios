#import <Foundation/Foundation.h>
#import "MMCoinModel.h"

@protocol MMWatchListUpdateProtocol <NSObject>

- (void)addCoinToWatchList:(MMCoinModel *)coin;
- (void)removeCoinToWatchList:(MMCoinModel *)coin;


@end
