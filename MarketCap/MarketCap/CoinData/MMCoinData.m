#import "MMCoinData.h"

@implementation MMCoinData

- (instancetype)initWithArray:(NSArray *)array andCurrency:(NSString *)currency
{
    self = [super init];
    if(self)
    {
        NSMutableDictionary *temporaryCoinList = [[array objectAtIndex: 0] mutableCopy];
        NSArray *keys = [temporaryCoinList allKeys];
        for(int i = 0; i < [keys count]; i++)
        {
            if(![[keys objectAtIndex: i] containsString: currency])
            {
                [temporaryCoinList removeObjectForKey: [keys objectAtIndex: i]];
            }
        }
        
        self.coinList = [temporaryCoinList copy];
    }
    
    return self;
}

@end
