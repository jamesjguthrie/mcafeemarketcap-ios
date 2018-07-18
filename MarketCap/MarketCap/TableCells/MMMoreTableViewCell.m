#import "MMMoreTableViewCell.h"

@implementation MMMoreTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setCellTheme:(MMTheme *)theme
{
    self.contentView.backgroundColor = theme.backgroundColor;
    self.textLabel.textColor = theme.fontColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
