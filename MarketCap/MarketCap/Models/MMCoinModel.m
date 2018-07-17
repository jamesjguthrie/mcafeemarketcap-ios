@implementation MMCoinModel

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
