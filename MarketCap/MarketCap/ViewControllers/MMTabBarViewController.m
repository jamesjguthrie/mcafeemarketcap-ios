#import "MMTabBarViewController.h"

@interface MMTabBarViewController ()

@end

@implementation MMTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.backgroundColor = [UIColor colorWithRed: 29.0 / 255.0 green: 29.0 / 255.0  blue: 29.0 / 255.0  alpha: 1.0];
    
    self.tabBar.barTintColor = [UIColor colorWithRed: 29.0 / 255.0 green: 29.0 / 255.0  blue: 29.0 / 255.0  alpha: 1.0];
    [[UITabBarItem appearance] setTitleTextAttributes: @{ NSForegroundColorAttributeName : [UIColor whiteColor] }
                                             forState: UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes: @{ NSForegroundColorAttributeName : [UIColor orangeColor] }
                                             forState: UIControlStateSelected];
}

@end
