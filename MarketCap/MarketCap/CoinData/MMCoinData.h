#import "MMCoinList.h"
#import "MMCoinPrice.h"

@interface MMCoinData : NSArray

@property(strong, nonatomic) MMCoinList *coinList;

- (instancetype)initWithArray:(NSArray *)array;
- (MMCoinPrice *)coinPriceAtIndex:(NSInteger)index;
- (NSArray *)coinKeys;

@end
