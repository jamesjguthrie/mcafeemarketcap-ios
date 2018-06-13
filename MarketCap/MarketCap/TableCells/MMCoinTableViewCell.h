#import <UIKit/UIKit.h>

@interface MMCoinTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *coinIcon;
@property (weak, nonatomic) IBOutlet UILabel *coinName;
@property (weak, nonatomic) IBOutlet UILabel *coinPrice;
@property (weak, nonatomic) IBOutlet UILabel *percentageChange;

@end
