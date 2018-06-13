#import "MMMoreViewController.h"

@interface MMMoreViewController ()

@end

@implementation MMMoreViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil
                          bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil
                           bundle: nibBundleOrNil];
    if(self)
    {
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
