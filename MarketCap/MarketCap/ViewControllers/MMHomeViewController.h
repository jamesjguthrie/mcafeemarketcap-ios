@interface MMHomeViewController : MMViewController <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithCloudManager:(MMCloudManager *)cloudManager
                             nibName:(NSString *)nibNameOrNil
                              bundle:(NSBundle *)nibBundleOrNil;

@end
