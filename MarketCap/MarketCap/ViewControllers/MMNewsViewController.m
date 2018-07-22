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

- (NSString *)tabBarTitle
{
    return mNews;
}

- (UIImage *)tabBarImage
{
    return [UIImage imageNamed: @"NewsTabGlyph"];
}

- (UIImage *)tabBarSelectedImage
{
    return [UIImage imageNamed: @"NewsTabGlyph"];
}

@end
