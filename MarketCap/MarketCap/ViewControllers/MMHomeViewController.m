#import "MMHomeViewController.h"
#import "MMCoinTableViewCell.h"

@interface MMHomeViewController ()<MMWatchListProtocol>
{
    VPSocketIOClient *socket;
}

@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UIButton *watchlistButton;
@property (weak, nonatomic) IBOutlet UIButton *moversButton;
@property (weak, nonatomic) IBOutlet UIButton *losersButton;
@property (weak, nonatomic) IBOutlet UITableView *coinTable;
@property (strong, nonatomic) MMCoinList *coinList;
@property (strong, nonatomic) MMCoinData *coinData;
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
        self->socket = cloudManager.socket;
        [socket connect];
        self.title = mCryptos;
        self.tabBarItem.image = [UIImage imageNamed: @"CryptosLogo"];
        self.tabBarItem.selectedImage = [UIImage imageNamed: @"CryptosLogo"];
        self.selectedCurrency = @"-USD";
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
             self.coinData = [[MMCoinData alloc] initWithArray: data];
             [self.coinTable reloadData];
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
    cell.coinPrice.text = [NSString stringWithFormat: @"%f", [number doubleValue]];
    cell.coinName.text = [[[[self.coinData coinKeys] objectAtIndex: indexPath.row] componentsSeparatedByString: self.selectedCurrency] objectAtIndex: 0];
    cell.favoritesButton.watchListDelegate = self;
    
    return cell;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
}

- (IBAction)allButtonAction:(UIButton *)sender
{
    [self.allButton setEnabled: NO];
    [self.watchlistButton setEnabled: YES];
    [self.moversButton setEnabled: YES];
    [self.losersButton setEnabled: YES];
}

- (IBAction)watchlistButtonAction:(UIButton *)sender
{
    [self.allButton setEnabled: YES];
    [self.watchlistButton setEnabled: NO];
    [self.moversButton setEnabled: YES];
    [self.losersButton setEnabled: YES];
}

- (IBAction)moversButtonAction:(UIButton *)sender
{
    [self.allButton setEnabled: YES];
    [self.watchlistButton setEnabled: YES];
    [self.moversButton setEnabled: NO];
    [self.losersButton setEnabled: YES];
}

- (IBAction)losersButtonAction:(UIButton *)sender
{
    [self.allButton setEnabled: YES];
    [self.watchlistButton setEnabled: YES];
    [self.moversButton setEnabled: YES];
    [self.losersButton setEnabled: NO];
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
