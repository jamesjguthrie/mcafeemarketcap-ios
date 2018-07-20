#import "MMCoinList.h"


@interface MMCoinData : NSArray

@property(strong, nonatomic) MMCoinList *coinList;

- (instancetype)initWithArray:(NSArray *)array andCurrency:(NSString *)currency;

@end
