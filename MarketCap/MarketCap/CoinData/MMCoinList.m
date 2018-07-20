#import "MMCoinList.h"
#import "MMCoinModel.h"

@implementation MMCoinList

- (instancetype)initCoinList
{
    self = [super init];
    if(self)
    {
        self.coins = [NSMutableArray new];
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [self initCoinList];
    self.coins = [NSMutableArray new];
    NSArray *coins = [dictionary objectForKey: @"data"];
    for(int i = 0; i < [coins count]; i++)
    {
        [self.coins addObject: [[MMCoinModel alloc] initWithResponseData: [coins objectAtIndex: i]]];
    }
    
    return self;
}

@end
