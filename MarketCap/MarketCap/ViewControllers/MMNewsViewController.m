#import "MMNewsViewController.h"

@interface MMNewsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *newsTable;

@end

@implementation MMNewsViewController

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
                        themeManager:(MMThemeManager *)themeManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil
                           bundle: nibBundleOrNil];
    if(self)
    {
        self.cloudManager = cloudManager;
        self.themeManager = themeManager;
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
