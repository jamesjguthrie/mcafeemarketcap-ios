#import "MMCoinModel.h"

@implementation MMCoinModel

- (instancetype)initWithImage:(UIImageView *)image
                         name:(NSString *)coinName
                    coinPrice:(NSString *)coinPrice
                percentChange:(NSString *)percentage
{
    self = [super init];
    if(self)
    {
        self.coinImage = image;
        self.coinName = coinName;
        self.coinPrice = coinPrice;
        self.percentageChange = percentage;
        return self;
    }
    
    return self;
}

@end
