#import "MMDayTheme.h"

@implementation MMDayTheme

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.tabBarColor = [UIColor whiteColor];
        self.fontColor = [UIColor blackColor];
        self.lineSeparatorColor = [UIColor blackColor];
        self.watchListUnselectedColor = [UIColor lightGrayColor];
    }
    
    return self;
}

@end
