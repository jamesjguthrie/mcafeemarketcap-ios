#import "MMCoinTableViewCell.h"

@interface MMCoinTableViewCell ()

@property (strong, nonatomic) MMCoinModel *coin;

@end

@implementation MMCoinTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.favoritesButton.delegate = self;
}

- (void)populateCellWithModel:(MMCoinModel *)coinModel
{
    self.coin = coinModel;
    self.coinPrice.text = [NSString stringWithFormat: @"%f", [coinModel.coinPrice doubleValue]];
    self.coinName.text = coinModel.coinName;
    self.coinSymbol.text = coinModel.coinSymbol;
    self.percentageChange.text = [NSString stringWithFormat: @"%f", [coinModel.percentChangeTwentyFourHours doubleValue]];
    self.coinRank.text = [NSString stringWithFormat: @"%li", (long)[coinModel.coinRank integerValue]];
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
    if(selected)
    {
        [button.watchListDelegate addToWatchList: self.coin];
    }
    else
    {
        [button.watchListDelegate removeFromWatchList: self.coin];
    }
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
