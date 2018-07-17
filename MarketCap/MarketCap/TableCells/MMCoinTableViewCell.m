#import "MMCoinTableViewCell.h"

@implementation MMCoinTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.favoritesButton.delegate = self;
}

- (void)setCellTheme:(MMTheme *)theme
{
    self.contentView.backgroundColor = theme.backgroundColor;
    self.coinRank.textColor = theme.fontColor;
    self.coinRank.backgroundColor = theme.backgroundColor;
    self.coinName.textColor = theme.fontColor;
    self.coinName.backgroundColor = theme.backgroundColor;
    self.coinSymbol.textColor = theme.fontColor;
    self.coinSymbol.backgroundColor = theme.backgroundColor;
    self.coinPrice.textColor = theme.fontColor;
    self.coinPrice.backgroundColor = theme.backgroundColor;
    self.percentageChange.textColor = theme.fontColor;
    self.percentageChange.backgroundColor = theme.backgroundColor;
    self.watchListSeparator.backgroundColor = theme.lineSeparatorColor;
    self.rankSeparator.backgroundColor = theme.lineSeparatorColor;
    self.iconSeparator.backgroundColor = theme.lineSeparatorColor;
    self.nameSeparator.backgroundColor = theme.lineSeparatorColor;
    self.watchListContainer.backgroundColor = theme.backgroundColor;
    self.nameContainer.backgroundColor = theme.backgroundColor;
    self.priceContainer.backgroundColor = theme.backgroundColor;
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
