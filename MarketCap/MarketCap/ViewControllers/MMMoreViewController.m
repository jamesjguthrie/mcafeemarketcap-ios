#import "MMMoreViewController.h"
#import "MMMoreTableViewCell.h"
#import "MMThemeManager.h"

@interface MMMoreViewController ()

@property (weak, nonatomic) IBOutlet UITableView *moreTableView;
@property (strong, nonatomic) NSMutableArray *moreOptions;

@end

@implementation MMMoreViewController

- (instancetype) initWithThemeManager:(MMThemeManager *)themeManager
                              nibName:(NSString *)nibNameOrNil
                               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithThemeManager:(MMThemeManager *)themeManager
                               nibName:(NSString *)nibNameOrNil
                                bundle:(NSBundle *)nibBundleOrNil];
            
    if(self)
    {
        self.moreOptions = [NSMutableArray new];
        [self.moreOptions addObject: [self.themeManager.selectedTheme isKindOfClass: [MMDayTheme class]] ? mDayTheme : mNightTheme];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
}

- (void)updateTheme
{
    [self.view setBackgroundColor: self.themeManager.selectedTheme.backgroundColor];
    self.moreTableView.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
    self.moreTableView.separatorColor = self.themeManager.selectedTheme.backgroundColor;
    [self.moreTableView reloadData];
    [self setNeedsStatusBarAppearanceUpdate];
    self.tabBarController.tabBar.barTintColor = self.themeManager.selectedTheme.tabBarColor;
    self.tabBarController.tabBar.backgroundColor = self.themeManager.selectedTheme.tabBarColor;
    [self updateNavBar];
}

- (MMMoreTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMMoreTableViewCell *cell = (MMMoreTableViewCell *)[tableView dequeueReusableCellWithIdentifier: mMoreCellIdentifier];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed: mMoreTableCell
                                              owner: self
                                            options: nil] objectAtIndex: 0];
    }

    [cell setCellTheme: self.themeManager.selectedTheme];
    cell.titleLabel.text = [NSString stringWithFormat: @"   Set to %@",[self.themeManager.selectedTheme isKindOfClass: [MMDayTheme class]] ? mNightTheme : mDayTheme];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        [self.themeManager switchCurrentTheme];
        [self updateTheme];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.moreOptions count];
}

#pragma - mark MMCommonTabBarVC Properties
- (NSString *)tabBarTitle
{
    return mMore;
}

- (UIImage *)tabBarImage
{
    return [UIImage imageNamed: mMoreTabGlyph];
}

- (UIImage *)tabBarSelectedImage
{
    return [UIImage imageNamed: mMoreTabGlyph];
}

@end
