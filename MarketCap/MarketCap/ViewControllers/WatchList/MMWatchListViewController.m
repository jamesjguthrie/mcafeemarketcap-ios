#import "MMWatchListViewController.h"
#import "MMCoinTableViewCell.h"
#import "MMWatchListProtocol.h"
#import "MMCoinModel.h"

@interface MMWatchListViewController ()<MMWatchListProtocol>

@property (weak, nonatomic) IBOutlet UITableView *watchListTable;
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
        self.watchList = watchList;
    }
    
    return self;
}

- (void)updateTheme
{
    self.view.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
    self.watchListTable.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
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
    [cell.favoritesButton setSelected: YES];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.watchList count];
}

- (void)addCoinToWatchList:(MMCoinModel *)coin
{
    [self.watchList addObject: coin];
    [self.watchListTable reloadData];
}

- (void)removeCoinToWatchList:(MMCoinModel *)coin
{
    [self.watchList removeObject: coin];
    [self.watchListTable reloadData];
}

- (void)addToWatchList:(MMCoinModel *)coin
{
    [self.watchList addObject: coin];
    [self.watchListTable reloadData];
}

- (void)removeFromWatchList:(MMCoinModel *)coin
{
    [self.watchList removeObject: coin];
    [self.watchListTable reloadData];
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
