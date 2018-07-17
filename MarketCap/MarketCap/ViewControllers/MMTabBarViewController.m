#import "MMTabBarViewController.h"
#import "MMThemeManager.h"

@interface MMTabBarViewController ()

@end

@implementation MMTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBar.backgroundColor = [MMThemeManager sharedManager].selectedTheme.tabBarColor;
    self.tabBar.barTintColor = [MMThemeManager sharedManager].selectedTheme.tabBarColor;
    [[UITabBarItem appearance] setTitleTextAttributes: @{ NSForegroundColorAttributeName : [UIColor whiteColor] }
                                             forState: UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes: @{ NSForegroundColorAttributeName : [UIColor orangeColor] }
                                             forState: UIControlStateSelected];
}

@end
