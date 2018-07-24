#import "AppDelegate.h"

@interface AppDelegate ()

@property(strong, nonatomic) MMCloudManager *cloudManager;
@property(strong, nonatomic) NSMutableArray *watchList;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.cloudManager = [MMCloudManager sharedSession];
    self.watchList = [NSMutableArray new];
    self.tabBarController = [[MMTabBarViewController alloc] initWithThemeManager: [MMThemeManager sharedManager]];
    
    MMHomeViewController *homeVC = [[MMHomeViewController alloc] initWithWatchList: self.watchList
                                                                      cloudManager: self.cloudManager
                                                                      themeManager: [MMThemeManager sharedManager]
                                                                           nibName: mHomeViewController
                                                                            bundle: nil];
    
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController: homeVC];
    
    MMWatchListViewController *watchVC = [[MMWatchListViewController alloc] initWithWatchList: self.watchList
                                                                                 themeManager: [MMThemeManager sharedManager]
                                                                                      nibName: mWatchListViewController
                                                                                       bundle: nil];
    
    UINavigationController *watchNav = [[UINavigationController alloc] initWithRootViewController: watchVC];
    
    MMNewsViewController *newsVC = [[MMNewsViewController alloc] initWithThemeManager: [MMThemeManager sharedManager]
                                                                              nibName: mNewsViewController
                                                                               bundle: nil];
    
    UINavigationController *newsNav = [[UINavigationController alloc] initWithRootViewController: newsVC];
    
    MMMoreViewController *moreVC = [[MMMoreViewController alloc] initWithThemeManager: [MMThemeManager sharedManager]
                                                                              nibName: mMoreViewController
                                                                               bundle: nil];
    
    UINavigationController *moreNav = [[UINavigationController alloc] initWithRootViewController: moreVC];
    
    homeVC.watchListUpdateDelegate = watchVC;
    self.tabBarController.viewControllers = [NSArray arrayWithObjects: homeNav, watchNav, newsNav, moreNav, nil];
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
