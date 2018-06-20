@implementation MMCoinData

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if(self)
    {
        self.coinList = [array objectAtIndex: 0];
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
