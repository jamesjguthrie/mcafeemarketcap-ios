#import "MMHomeViewController.h"
#import "MMCoinTableViewCell.h"
#import "MMDataReceiverProtocol.h"
#import "MMCoinList.h"
#import "MMCoinModel.h"

@interface MMHomeViewController ()<MMWatchListProtocol>

@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UIButton *watchlistButton;
@property (weak, nonatomic) IBOutlet UITableView *coinTable;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) MMCoinList *coinList;
@property (strong, nonatomic) NSString *selectedCurrency;

@end

@implementation MMHomeViewController

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
        [self.cloudManager generateDataTaskWithURL: @"https://api.coinmarketcap.com/v2/ticker/?limit=100&sort=rank&structure=array"];
        self.coinList = [[MMCoinList alloc] initCoinList];
        self.title = mCoins;
        self.tabBarItem.image = [UIImage imageNamed: @"CoinsTabGlyph"];
        self.tabBarItem.selectedImage = [UIImage imageNamed: @"CoinsTabGlyph"];
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
    [self.view setBackgroundColor: self.themeManager.selectedTheme.backgroundColor];
    self.loadingView.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
    self.coinTable.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
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
