#import <UIKit/UIKit.h>

@class MMFavoritesButton;
@class MMFavoritesIconView;

@interface DotColors : NSObject
{
    @public
    UIColor *first;
    UIColor *second;
}

+ (instancetype)dotColorsWithFirst:(UIColor *)firstColor second:(UIColor *)secondColor;

@end

@protocol MMFavoriteButtonDelegate <NSObject>

- (void)faveButton:(MMFavoritesButton *)button didSelect:(BOOL)selected;

- (NSArray<DotColors *> *)dotColorsWithFaveButton:(MMFavoritesButton *)button;

@end

@interface MMFavoritesButton : UIButton

@property (weak, nonatomic) id<MMFavoriteButtonDelegate> delegate;
@property (assign, nonatomic) NSInteger sparkGroupCount;
@property (strong, nonatomic) UIImage *favecIconImage;
@property (strong, nonatomic) MMFavoritesIconView *faveIcon;

@property (strong, nonatomic) UIColor *normalColor;
@property (strong, nonatomic) UIColor *selectedColor;
@property (strong, nonatomic) UIColor *dotFirstColor;
@property (strong, nonatomic) UIColor *dotSecondColor;
@property (strong, nonatomic) UIColor *circleFromColor;
@property (strong, nonatomic) UIColor *circleToColor;

- (instancetype)initWithFrame:(CGRect)frame faveIconNormal:(UIImage *)image;

- (instancetype)initWithFrame:(CGRect)frame;

- (instancetype)initWithCoder:(NSCoder *)aDecoder;

@end
