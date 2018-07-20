#import "MMCoinModel.h"

@implementation MMCoinModel

- (instancetype)initWithResponseData:(NSDictionary *)dictionary
{
    self = [super init];
    if(self)
    {
        self.coinName = [dictionary objectForKey: @"name"];
        self.coinSymbol = [dictionary objectForKey: @"symbol"];
        self.coinRank = [[NSNumber alloc] initWithInteger: [[dictionary objectForKey: @"rank"] integerValue]];
        [self setCoinPricing: [dictionary objectForKey: @"quotes"]];
    }
    
    return self;
}

- (void)setCoinPricing:(NSDictionary *)priceDictionary
{
    NSDictionary *coinPrices = [priceDictionary objectForKey: @"USD"];

    self.coinPrice = [[NSNumber alloc] initWithDouble: [[coinPrices objectForKey: @"price"] doubleValue]];
    self.percentChangeOneHour = [[NSNumber alloc] initWithDouble: [[coinPrices objectForKey: @"percent_change_1h"] doubleValue]];
    self.percentChangeTwentyFourHours = [[NSNumber alloc] initWithDouble: [[coinPrices objectForKey: @"percent_change_24h"] doubleValue]];
    self.percentChangeOneWeek = [[NSNumber alloc] initWithDouble: [[coinPrices objectForKey: @"percent_change_7d"] doubleValue]];
}

@end
