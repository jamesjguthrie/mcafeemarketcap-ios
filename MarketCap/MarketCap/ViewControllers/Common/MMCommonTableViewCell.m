#import "MMCommonTableViewCell.h"

@implementation MMCommonTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setCellTheme:(MMTheme *)theme
{
    NSAssert(false, @"Cell theme must be implemented by child class");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected: selected animated: animated];
}

@end
