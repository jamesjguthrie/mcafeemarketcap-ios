#import "MMNewsViewController.h"

@interface MMNewsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *newsTable;

@end

@implementation MMNewsViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil
                          bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil
                           bundle: nibBundleOrNil];
    if(self)
    {
        self.title = mNews;
        self.tabBarItem.image = [UIImage imageNamed: @"CryptosLogo"];
        self.tabBarItem.selectedImage = [UIImage imageNamed: @"CryptosLogo"];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
