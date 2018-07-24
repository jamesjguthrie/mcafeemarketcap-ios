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
        self.navigationItem.title = [self tabBarTitle];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
}

- (void)updateNavBar
{
    [self.navigationController.navigationBar setBarTintColor: self.themeManager.selectedTheme.backgroundColor];
    [self.navigationController.navigationBar setTintColor: self.themeManager.selectedTheme.backgroundColor];
    [self.navigationController.navigationBar setTranslucent: NO];
    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObject: self.themeManager.selectedTheme.fontColor
                                                                                                 forKey: NSForegroundColorAttributeName]];
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
