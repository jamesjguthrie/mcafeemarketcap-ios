#import "MMWatchListViewController.h"

@interface MMWatchListViewController ()

@property(strong, nonatomic) NSMutableArray *watchList;

@end

@implementation MMWatchListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (instancetype)initWithWatchList:(NSMutableArray *)watchList
                     themeManager:(MMThemeManager *)themeManager
                          nibName:(NSString *)nibNameOrNil
                           bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithThemeManager: themeManager
                               nibName: nibNameOrNil
                                bundle: nibBundleOrNil];
    if(self)
    {

    }
    
    return self;
}

- (void)updateTheme
{
    self.view.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
}


#pragma - mark MMCommonTabBarVC Properties
- (NSString *)tabBarTitle
{
    return mWatchList;
}

- (UIImage *)tabBarImage
{
    return [UIImage imageNamed: mWatchListTabImage];
}

- (UIImage *)tabBarSelectedImage
{
    return [UIImage imageNamed: mWatchListTabImage];
}

@end
