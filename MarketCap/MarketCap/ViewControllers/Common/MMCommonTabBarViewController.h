#import "MMCommonViewController.h"

@interface MMCommonTabBarViewController : MMCommonViewController

- (NSString *)tabBarTitle;
- (UIImage *)tabBarImage;
- (UIImage *)tabBarSelectedImage;

- (void)updateNavBar;

@end
