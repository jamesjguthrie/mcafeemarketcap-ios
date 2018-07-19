#import "MMHomeViewController.h"
#import "MMCoinTableViewCell.h"
#import "MMThemeManager.h"
#import "MMCoinList.h"
#import "MMCoinData.h"
#import "MMCoinModel.h"

@interface MMHomeViewController ()<MMWatchListProtocol>

@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UIButton *watchlistButton;
@property (weak, nonatomic) IBOutlet UITableView *coinTable;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) MMCoinList *coinList;
@property (strong, nonatomic) MMCoinData *coinData;
@property (strong, nonatomic) NSMutableArray *tempCoinArray;
@property (strong, nonatomic) NSString *selectedCurrency;
@property (assign, nonatomic) BOOL switchColors;

@end

@implementation MMHomeViewController

- (void)createTempCoinData
{
    MMCoinModel *bitcoin = [[MMCoinModel alloc] initWithName: @"Bitcoin" coinSymbol: @"BTC" coinPrice: @"$6400" percentChange: @"15%"];
    MMCoinModel *eth = [[MMCoinModel alloc] initWithName: @"Ethereum" coinSymbol: @"ETH" coinPrice: @"$419" percentChange: @"3%"];
    MMCoinModel *card = [[MMCoinModel alloc] initWithName: @"Cardano" coinSymbol: @"ADA" coinPrice: @"$.1511" percentChange: @"-1.5%"];
    MMCoinModel *safex = [[MMCoinModel alloc] initWithName: @"Safex" coinSymbol: @"SAFEX" coinPrice: @"$.02" percentChange: @"1.1%"];
    MMCoinModel *stellar = [[MMCoinModel alloc] initWithName: @"Stellar" coinSymbol: @"XLM" coinPrice: @"$.18" percentChange: @"3.1%"];
    MMCoinModel *lite = [[MMCoinModel alloc] initWithName: @"LiteCoin" coinSymbol: @"LTC" coinPrice: @"$76.12" percentChange: @"1.0%"];
    MMCoinModel *bitCash = [[MMCoinModel alloc] initWithName: @"Bitcoin Cash" coinSymbol: @"BCH" coinPrice: @"$700" percentChange: @"1.5%"];
    MMCoinModel *zeroX = [[MMCoinModel alloc] initWithName: @"0x" coinSymbol: @"ZRX" coinPrice: @"$1.13" percentChange: @"-6.1%"];
    MMCoinModel *ark = [[MMCoinModel alloc] initWithName: @"Ark" coinSymbol: @"ARK" coinPrice: @"$1.55" percentChange: @"5.1%"];
    MMCoinModel *bezop = [[MMCoinModel alloc] initWithName: @"Bezop" coinSymbol: @"BEZ" coinPrice: @"$.101" percentChange: @"2.1%"];
    MMCoinModel *dan = [[MMCoinModel alloc] initWithName: @"Daneel" coinSymbol: @"DAN" coinPrice: @"$.66" percentChange: @"-9.9%"];
    [self.tempCoinArray addObject: bitcoin];
    [self.tempCoinArray addObject: eth];
    [self.tempCoinArray addObject: card];
    [self.tempCoinArray addObject: safex];
    [self.tempCoinArray addObject: stellar];
    [self.tempCoinArray addObject: lite];
    [self.tempCoinArray addObject: bitCash];
    [self.tempCoinArray addObject: zeroX];
    [self.tempCoinArray addObject: ark];
    [self.tempCoinArray addObject: bezop];
    [self.tempCoinArray addObject: dan];
}

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
                              nibName:(NSString *)nibNameOrNil
                               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if(self)
    {
        self.tempCoinArray = [NSMutableArray new];
        [self createTempCoinData];
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
    [self.view setBackgroundColor: [MMThemeManager sharedManager].selectedTheme.backgroundColor];
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
    }
    MMCoinModel *coin = [self.tempCoinArray objectAtIndex: indexPath.row];
    cell.coinRank.text = [NSString stringWithFormat: @"%li", (long)(indexPath.row + 1)];
    cell.coinName.text = coin.coinName;
    cell.coinPrice.text = coin.coinPrice;
    cell.coinSymbol.text = coin.coinSymbol;
    cell.percentageChange.text = coin.percentageChange;
    cell.favoritesButton.watchListDelegate = self;
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
    return [self.tempCoinArray count];

    //return [[self.coinData coinKeys] count];
}

- (void)addToWatchList:(NSIndexPath *)indexPath
{
    NSLog(@"WatchList!");
}

@end
