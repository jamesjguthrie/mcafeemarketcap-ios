#import "MMHomeViewController.h"
#import "MMCoinTableViewCell.h"
#import "MMDataReceiverProtocol.h"
#import "MMWatchListProtocol.h"
#import "MMWatchListUpdateProtocol.h"
#import "MMCoinList.h"
#import "MMCoinModel.h"

@interface MMHomeViewController ()<MMWatchListProtocol>

@property (weak, nonatomic) IBOutlet UITableView *coinTable;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) MMCoinList *coinList;
@property (strong, nonatomic) NSMutableArray *watchList;

@end

@implementation MMHomeViewController

- (instancetype)initWithWatchList:(NSMutableArray *)watchList
                     cloudManager:(MMCloudManager *)cloudManager
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
        self.watchList = watchList;
        self.coinList = [[MMCoinList alloc] initCoinList];
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.loadingView setHidden: YES];
}

- (NSString *)urlString
{
    return @"https://api.coinmarketcap.com/v2/ticker/?limit=100&sort=rank&structure=array";
}

- (void)setData:(id)dataObject
{
    self.coinList = [[MMCoinList alloc] initWithDictionary: dataObject];
    [self updateTheme];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
}

- (void)updateTheme
{
    [self.view setBackgroundColor: self.themeManager.selectedTheme.backgroundColor];
    self.loadingView.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
    self.coinTable.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
    self.coinTable.separatorColor = self.themeManager.selectedTheme.backgroundColor;
    [self.coinTable reloadData];
}

- (MMCoinTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMCoinTableViewCell *cell = (MMCoinTableViewCell *)[tableView dequeueReusableCellWithIdentifier: mCoinCellIdentifier];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed: mCoinTableCell
                                              owner: self
                                            options: nil] objectAtIndex: 0];
        cell.favoritesButton.watchListDelegate = self;
    }
    
    [cell populateCellWithModel: [self.coinList.coins objectAtIndex: indexPath.row]];
    [cell setCellTheme: self.themeManager.selectedTheme];
    [cell.favoritesButton setColorWithoutAnimation: [self.watchList containsObject: [self.coinList.coins objectAtIndex: indexPath.row]]];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[[NSBundle mainBundle] loadNibNamed: mTableHeaderView
                                          owner: self
                                        options: nil] objectAtIndex: 0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.coinList.coins count];
}

- (void)addToWatchList:(MMCoinModel *)coin
{
    [self.watchListUpdateDelegate addCoinToWatchList: coin];
}

- (void)removeFromWatchList:(MMCoinModel *)coin
{
    [self.watchListUpdateDelegate removeCoinToWatchList: coin];
}

#pragma - mark MMCommonTabBarVC Properties
- (NSString *)tabBarTitle
{
    return mCoins;
}

- (UIImage *)tabBarImage
{
    return [UIImage imageNamed: mCoinTabGlpyh];
}

- (UIImage *)tabBarSelectedImage
{
    return [UIImage imageNamed: mCoinTabGlpyh];
}

@end
