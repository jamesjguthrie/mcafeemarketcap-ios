#import "MMTabBarViewController.h"

@interface MMTabBarViewController ()

@property(strong, nonatomic) MMThemeManager *themeManager;

@end

@implementation MMTabBarViewController

- (instancetype)initWithThemeManager:(MMThemeManager *)themeManager
{
    self = [super init];
    if(self)
    {
        self.themeManager = themeManager;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBar.backgroundColor = self.themeManager.selectedTheme.tabBarColor;
    self.tabBar.barTintColor = self.themeManager.selectedTheme.tabBarColor;
}

@end
