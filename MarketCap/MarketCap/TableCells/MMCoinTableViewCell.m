#import "MMCoinTableViewCell.h"

@implementation MMCoinTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.favoritesButton.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected: selected animated: animated];
}

- (void)faveButton:(MMFavoritesButton *)button didSelect:(BOOL)selected
{
    [button.watchListDelegate addToWatchList: self.indexPath];
}

- (NSArray<DotColors *> *)dotColors:(MMFavoritesButton *)button
{
    return @[
             [DotColors dotColorsWithFirst: [UIColor orangeColor] second: [UIColor orangeColor]],
             [DotColors dotColorsWithFirst: [UIColor orangeColor] second: [UIColor orangeColor]],
             [DotColors dotColorsWithFirst: [UIColor orangeColor] second: [UIColor orangeColor]],
             [DotColors dotColorsWithFirst: [UIColor orangeColor] second: [UIColor orangeColor]],
             [DotColors dotColorsWithFirst: [UIColor orangeColor] second: [UIColor orangeColor]],
             ];
}

@end
