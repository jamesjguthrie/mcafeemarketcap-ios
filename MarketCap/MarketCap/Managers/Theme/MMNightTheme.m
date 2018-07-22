#import "MMNightTheme.h"

@implementation MMNightTheme

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.backgroundColor = [UIColor blackColor];
        self.tabBarColor = [UIColor blackColor];
        self.fontColor = [UIColor whiteColor];
        self.lineSeparatorColor = [UIColor whiteColor];
        self.watchListUnselectedColor = [UIColor lightGrayColor];
        self.statusBarStyle = UIStatusBarStyleLightContent;
    }
    
    return self;
}

@end
