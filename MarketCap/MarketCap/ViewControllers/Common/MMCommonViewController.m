#import "MMCommonViewController.h"

@interface MMCommonViewController ()

@end

@implementation MMCommonViewController

- (instancetype)initWithThemeManager:(MMThemeManager *)themeManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if(self)
    {
        self.themeManager = themeManager;
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
    [self updateTheme];
}

- (void)updateTheme
{
    NSAssert(false, @"Must be implemented by child class");
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.themeManager.selectedTheme.statusBarStyle;
}

@end
