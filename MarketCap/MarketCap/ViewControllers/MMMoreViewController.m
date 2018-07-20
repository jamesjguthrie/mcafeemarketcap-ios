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
    self = [super initWithNibName: nibNameOrNil
                           bundle: nibBundleOrNil];
    if(self)
    {
        self.themeManager = themeManager;
        self.moreOptions = [NSMutableArray new];
        [self.moreOptions addObject: [self.themeManager.selectedTheme isKindOfClass: [MMDayTheme class]] ? mDayTheme : mNightTheme];
        self.tabBarItem.title = mMore;
        self.tabBarItem.image = [UIImage imageNamed: @"SampleMenuButton.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed: @"SampleMenuButton.png"];
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
    [self.view setBackgroundColor: self.themeManager.selectedTheme.backgroundColor];
    self.moreTableView.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
}

- (void)updateTheme
{
    [self.view setBackgroundColor: self.themeManager.selectedTheme.backgroundColor];
    self.moreTableView.backgroundColor = self.themeManager.selectedTheme.backgroundColor;
    [self.moreTableView reloadData];
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
    cell.textLabel.text = [self.themeManager.selectedTheme isKindOfClass: [MMDayTheme class]] ? mDayTheme : mNightTheme;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        self.themeManager.selectedTheme = [self.themeManager.selectedTheme isKindOfClass: [MMDayTheme class]] ? self.themeManager.nightTheme : self.themeManager.dayTheme;
        [self updateTheme];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.moreOptions count];
}

@end
