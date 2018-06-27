#import "MMCoinTableViewCell.h"

@implementation MMCoinTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.favoritesButton.delegate = self;
}

- (void)setColor:(UIColor *)color
{
    self.coinRank.textColor = color;
    self.coinName.textColor = color;
    self.coinSymbol.textColor = color;
    self.coinPrice.textColor = color;
    self.percentageChange.textColor = color;
    self.watchListSeparator.backgroundColor = color;
    self.rankSeparator.backgroundColor = color;
    self.iconSeparator.backgroundColor = color;
    self.nameSeparator.backgroundColor = color;
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
