#import "MMCommonTabBarViewController.h"

@interface MMCommonTabBarViewController ()

@end

@implementation MMCommonTabBarViewController

- (instancetype)initWithThemeManager:(MMThemeManager *)themeManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithThemeManager: themeManager
                               nibName: nibNameOrNil
                                bundle: nibBundleOrNil];
    if(self)
    {
        self.tabBarItem.title = [self tabBarTitle];
        self.tabBarItem.image = [self tabBarImage];
        self.tabBarItem.selectedImage = [self tabBarSelectedImage];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSString *)tabBarTitle
{
    NSAssert(false, @"Must be implemented by child class");
    return nil;
}

- (UIImage *)tabBarImage
{
    NSAssert(false, @"Must be implemented by child class");
    return nil;
}

- (UIImage *)tabBarSelectedImage
{
    NSAssert(false, @"Must be implemented by child class");
    return nil;
}

@end
