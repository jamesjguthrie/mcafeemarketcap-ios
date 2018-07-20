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

- (instancetype)initWithName:(NSString *)coinName
                  coinSymbol:(NSString *)coinSymbol
                   coinPrice:(NSString *)coinPrice
               percentChange:(NSString *)percentage
{
    self = [self initWithImage: nil
                          name: coinName
                    coinSymbol: coinSymbol
                     coinPrice: coinPrice
                 percentChange: percentage];
    if(self)
    {
        self.coinImage = nil;
        self.coinName = coinName;
        self.coinSymbol = coinSymbol;
        self.coinPrice = coinPrice;
        self.percentageChange = percentage;
        return self;
    }
    
    return self;
}

- (instancetype)initWithImage:(UIImageView *)image
                         name:(NSString *)coinName
                   coinSymbol:(NSString *)coinSymbol
                    coinPrice:(NSString *)coinPrice
                percentChange:(NSString *)percentage
{
    self = [super init];
    if(self)
    {
        self.coinImage = image;
        self.coinName = coinName;
        self.coinSymbol = coinSymbol;
        self.coinPrice = coinPrice;
        self.percentageChange = percentage;
        return self;
    }
    
    return self;
}

@end
