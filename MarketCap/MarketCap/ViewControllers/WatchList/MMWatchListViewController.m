#import "MMWatchListViewController.h"
#import "MMCoinTableViewCell.h"
#import "MMWatchListProtocol.h"
#import "MMCoinModel.h"

@interface MMWatchListViewController ()<MMWatchListProtocol>

@property (weak, nonatomic) IBOutlet UITableView *watchListTable;
@property (weak, nonatomic) IBOutlet UILabel *noCoinsTitleLabel;
@property(strong, nonatomic) NSMutableArray *watchList;

@end

@implementation MMWatchListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
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
        self.watchList = watchList;
    }
    
    return self;
}

- (void)updateTheme
{
    self.view.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
    self.watchListTable.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
    self.watchListTable.separatorColor = self.themeManager.selectedTheme.backgroundColor;
    [self.watchListTable reloadData];
    [self.noCoinsTitleLabel setHidden: [self.watchList count] != 0];
    self.noCoinsTitleLabel.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
    self.noCoinsTitleLabel.textColor = self.themeManager.selectedTheme.fontColor;
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
    
    [cell populateCellWithModel: [self.watchList objectAtIndex: indexPath.row]];
    [cell setCellTheme: self.themeManager.selectedTheme];
    [cell.favoritesButton setColorWithoutAnimation: YES];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.watchList count];
}

- (void)addCoinToWatchList:(MMCoinModel *)coin
{
    [self.watchList addObject: coin];
    [self updateTheme];
}

- (void)removeCoinToWatchList:(MMCoinModel *)coin
{
    [self.watchList removeObject: coin];
    [self updateTheme];
}

- (void)addToWatchList:(MMCoinModel *)coin
{
    [self.watchList addObject: coin];
    [self updateTheme];
}

- (void)removeFromWatchList:(MMCoinModel *)coin
{
    [self.watchList removeObject: coin];
    [self updateTheme];
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
