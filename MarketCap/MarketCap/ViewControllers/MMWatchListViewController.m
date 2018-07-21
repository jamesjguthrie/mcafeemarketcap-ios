#import "MMWatchListViewController.h"

@interface MMWatchListViewController ()

@property(strong, nonatomic) NSMutableArray *watchList;

@end

@implementation MMWatchListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
themeManager:(MMThemeManager *)themeManager
nibName:(NSString *)nibNameOrNil
bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithCloudManager: cloudManager
                          themeManager: themeManager
                               nibName: nibNameOrNil
                                bundle: nibBundleOrNil];
    if(self)
    {
        self.themeManager = themeManager;
        self.title = mWatchList;
        self.tabBarItem.image = [UIImage imageNamed: @"CryptosLogo"];
        self.tabBarItem.selectedImage = [UIImage imageNamed: @"CryptosLogo"];
    }
    
    return self;
}

@end
