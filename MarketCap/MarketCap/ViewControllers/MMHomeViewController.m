#import "MMHomeViewController.h"
#import "MMCoinTableViewCell.h"

@interface MMHomeViewController ()<MMWatchListProtocol>
{
    VPSocketIOClient *socket;
}

@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UIButton *watchlistButton;
@property (weak, nonatomic) IBOutlet UITableView *coinTable;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) MMCoinList *coinList;
@property (strong, nonatomic) MMCoinData *coinData;
@property (strong, nonatomic) NSString *selectedCurrency;
@property (assign, nonatomic) BOOL switchColors;

@end

@implementation MMHomeViewController

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
                              nibName:(NSString *)nibNameOrNil
                               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if(self)
    {
        self->socket = cloudManager.socket;
        [socket connect];
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
    
    [socket on: mCoinPriceUpdate
      callback:^(NSArray *data, VPSocketAckEmitter *emitter)
     {
         if(data.count > 0)
         {
             self.coinData = [[MMCoinData alloc] initWithArray: data andCurrency: self.selectedCurrency];
             [self.coinTable reloadData];
             [self.loadingView setHidden: YES];
         }
     }];
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
    
    MMCoinPrice *number = [self.coinData coinPriceAtIndex: indexPath.row];
    cell.coinRank.text = [NSString stringWithFormat: @"%li", (long)(indexPath.row + 1)];
    cell.coinPrice.text = [NSString stringWithFormat: @"%f", [number doubleValue]];
    cell.coinSymbol.text = [[[[self.coinData coinKeys] objectAtIndex: indexPath.row] componentsSeparatedByString: self.selectedCurrency] objectAtIndex: 0];
    cell.favoritesButton.watchListDelegate = self;
    [cell setColor: [self setSwitchColors]];
    
    return cell;
}

- (UIColor *)setSwitchColors
{
    self.switchColors = !self.switchColors;
    
    if(self.switchColors)
    {
        return [UIColor greenColor];
    }
    
    return [UIColor redColor];
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
    return [[self.coinData coinKeys] count];
}

- (void)addToWatchList:(NSIndexPath *)indexPath
{
    NSLog(@"WatchList!");
}

@end
