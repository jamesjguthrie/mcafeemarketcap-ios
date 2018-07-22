#import "MMViewController.h"

@interface MMViewController ()<MMDataReceiverProtocol>

@end

@implementation MMViewController

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
                        themeManager:(MMThemeManager *)themeManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithThemeManager: themeManager nibName: nibNameOrNil bundle: nibBundleOrNil];
    if(self)
    {
        self.cloudManager = cloudManager;
        [self.cloudManager setDataDelegate: self];
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

- (void)setData:(id)dataObject
{
    NSAssert(false, @"Must be implemented by child classes");
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
