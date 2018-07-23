#import "MMCommonDataReceiverViewController.h"

@interface MMCommonDataReceiverViewController ()<MMDataReceiverProtocol>

@end

@implementation MMCommonDataReceiverViewController

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
                        themeManager:(MMThemeManager *)themeManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithThemeManager: themeManager
                               nibName: nibNameOrNil
                                bundle: nibBundleOrNil];
    if(self)
    {
        self.cloudManager = cloudManager;
        [self.cloudManager setDataDelegate: self];
        [self.cloudManager generateDataTaskWithURL: [self urlString]];
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

- (NSString *)urlString
{
    NSAssert(false, @"Must be implemented by child classes");
    return nil;
}

- (void)setData:(id)dataObject
{
    NSAssert(false, @"Must be implemented by child classes");
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

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.themeManager.selectedTheme.statusBarStyle;
}

@end
