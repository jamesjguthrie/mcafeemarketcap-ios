#import "MMNewsViewController.h"

@interface MMNewsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *newsTable;

@end

@implementation MMNewsViewController

- (instancetype)initWithThemeManager:(MMThemeManager *)themeManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithThemeManager: themeManager
                               nibName: nibNameOrNil
                                bundle: nibBundleOrNil];
    if(self)
    {
        self.title = mNews;
        self.tabBarItem.image = [UIImage imageNamed: @"NewsTabGlyph"];
        self.tabBarItem.selectedImage = [UIImage imageNamed: @"NewsTabGlyph"];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)updateTheme
{
    
}

- (void)setData:(id)dataObject
{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [[UITableViewCell alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

@end
