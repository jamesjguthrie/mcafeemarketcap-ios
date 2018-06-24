@interface MMCoinTableViewCell : UITableViewCell <MMFavoriteButtonDelegate>

@property (weak, nonatomic) IBOutlet UILabel *coinRank;
@property (weak, nonatomic) IBOutlet UIImageView *coinIcon;
@property (weak, nonatomic) IBOutlet UILabel *coinName;
@property (weak, nonatomic) IBOutlet UILabel *coinSymbol;

@property (weak, nonatomic) IBOutlet UILabel *coinPrice;
@property (weak, nonatomic) IBOutlet UILabel *percentageChange;
@property (weak, nonatomic) IBOutlet MMFavoritesButton *favoritesButton;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end
