#import "MMHomeViewController.h"
#import "MMCoinTableViewCell.h"
#import "MMDataReceiverProtocol.h"
#import "MMThemeManager.h"
#import "MMCoinList.h"
#import "MMCoinModel.h"

@interface MMHomeViewController ()<MMWatchListProtocol, MMDataReceiverProtocol>

@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UIButton *watchlistButton;
@property (weak, nonatomic) IBOutlet UITableView *coinTable;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) MMCloudManager *cloudManager;
@property (strong, nonatomic) MMCoinList *coinList;
@property (strong, nonatomic) NSString *selectedCurrency;

@end

@implementation MMHomeViewController

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
                              nibName:(NSString *)nibNameOrNil
                               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if(self)
    {
        self.cloudManager = cloudManager;
        [self.cloudManager setDataDelegate: self];
        [self.cloudManager generateDataTaskWithURL: @"https://api.coinmarketcap.com/v2/ticker/?limit=100&sort=rank&structure=array"];
        self.coinList = [[MMCoinList alloc] initCoinList];
        self.title = mCoins;
        self.tabBarItem.image = [UIImage imageNamed: @"CryptosLogo"];
        self.tabBarItem.selectedImage = [UIImage imageNamed: @"CryptosLogo"];
        self.selectedCurrency = mCurrencyBitcoin;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.loadingView setHidden: YES];
}

- (void)setData:(id)dataObject
{
    self.coinList = [[MMCoinList alloc] initWithDictionary: dataObject];
    [self updateTheme];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [self updateTheme];
}

- (void)updateTheme
{
    [self.view setBackgroundColor: [MMThemeManager sharedManager].selectedTheme.backgroundColor];
    self.loadingView.backgroundColor = [MMThemeManager sharedManager].selectedTheme.backgroundColor;
    self.coinTable.backgroundColor = [MMThemeManager sharedManager].selectedTheme.backgroundColor;
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
    
    MMCoinModel *coin = [self.coinList.coins objectAtIndex: indexPath.row];
    cell.coinPrice.text = [NSString stringWithFormat: @"%f", [coin.coinPrice doubleValue]];
    cell.coinName.text = coin.coinName;
    cell.coinSymbol.text = coin.coinSymbol;
    cell.percentageChange.text = [NSString stringWithFormat: @"%f", [coin.percentChangeTwentyFourHours doubleValue]];
    cell.coinRank.text = [NSString stringWithFormat: @"%li", (long)[coin.coinRank integerValue]];
    [cell setCellTheme: [MMThemeManager sharedManager].selectedTheme];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[[NSBundle mainBundle] loadNibNamed: mTableHeaderView
                                          owner: self
                                        options: nil] objectAtIndex: 0];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
}

- (IBAction)allButtonAction:(UIButton *)sender
{
    [self.allButton setEnabled: NO];
    [self.watchlistButton setEnabled: YES];
}

- (IBAction)watchlistButtonAction:(UIButton *)sender
{
    [self.allButton setEnabled: YES];
    [self.watchlistButton setEnabled: NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.coinList.coins count];
}

- (void)addToWatchList:(NSIndexPath *)indexPath
{
    NSLog(@"WatchList!");
}

@end
