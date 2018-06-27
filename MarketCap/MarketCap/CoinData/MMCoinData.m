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

- (MMCoinPrice *)coinPriceAtIndex:(NSInteger)index
{
    return [self.coinList objectForKey: [[self.coinList allKeys] objectAtIndex: index]];
}

- (NSArray *)coinKeys
{
    return [self.coinList allKeys];
}

@end
