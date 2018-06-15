#import "MMHomeViewController.h"
#import "MMCoinTableViewCell.h"
#import "MMWatchListProtocol.h"
#import "MMCoinModel.h"
#import "MMConstants.h"

@interface MMHomeViewController ()<MMWatchListProtocol>

@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UIButton *watchlistButton;
@property (weak, nonatomic) IBOutlet UIButton *moversButton;
@property (weak, nonatomic) IBOutlet UIButton *losersButton;

@property (weak, nonatomic) IBOutlet UITableView *coinTable;
@property (strong, nonatomic) NSMutableArray *coinArrayTest;

@end

@implementation MMHomeViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if(self)
    {
        self.title = mCryptos;
        self.tabBarItem.image = [UIImage imageNamed: @"CryptosLogo"];
        self.tabBarItem.selectedImage = [UIImage imageNamed: @"CryptosLogo"];
    }
    
    return self;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createDummyData];
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
    
    MMCoinModel *currentCoin = [self.coinArrayTest objectAtIndex: indexPath.row];
    cell.coinIcon = currentCoin.coinImage;
    cell.coinName.text = currentCoin.coinName;
    cell.coinPrice.text = currentCoin.coinPrice;
    cell.percentageChange.text = currentCoin.percentageChange;
    cell.indexPath = indexPath;
    cell.favoritesButton.watchListDelegate = self;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (void)addToWatchList:(NSIndexPath *)indexPath
{
    NSLog(@"WatchList!");
}

- (void)createDummyData
{
    self.coinArrayTest = [NSMutableArray new];
    [self.coinArrayTest addObject: [[MMCoinModel alloc] initWithImage: nil name: @"BTC" coinPrice: @"12,244.43" percentChange: @"12.7%"]];
    [self.coinArrayTest addObject: [[MMCoinModel alloc] initWithImage: nil name: @"ETH" coinPrice: @"600.13" percentChange: @"0.7%"]];
    [self.coinArrayTest addObject: [[MMCoinModel alloc] initWithImage: nil name: @"LTC" coinPrice: @"125.12" percentChange: @"1.7%"]];
    [self.coinArrayTest addObject: [[MMCoinModel alloc] initWithImage: nil name: @"ADA" coinPrice: @"0.37" percentChange: @"2.0%"]];
    [self.coinArrayTest addObject: [[MMCoinModel alloc] initWithImage: nil name: @"XLM" coinPrice: @"0.44" percentChange: @"14.2%"]];
    [self.coinArrayTest addObject: [[MMCoinModel alloc] initWithImage: nil name: @"ETC" coinPrice: @"14.23" percentChange: @"3.3%"]];
    [self.coinArrayTest addObject: [[MMCoinModel alloc] initWithImage: nil name: @"SUB" coinPrice: @"0.51" percentChange: @"6.9%"]];
    [self.coinArrayTest addObject: [[MMCoinModel alloc] initWithImage: nil name: @"DGX" coinPrice: @"122.12" percentChange: @"4.2%"]];
    [self.coinArrayTest addObject: [[MMCoinModel alloc] initWithImage: nil name: @"DOGE" coinPrice: @"0.0001" percentChange: @"1.1%"]];
    [self.coinArrayTest addObject: [[MMCoinModel alloc] initWithImage: nil name: @"ETN" coinPrice: @"0.27" percentChange: @"17.7%"]];
}

@end
