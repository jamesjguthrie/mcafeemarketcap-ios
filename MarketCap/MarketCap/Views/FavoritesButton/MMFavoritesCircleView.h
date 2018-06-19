@class MMFavoritesButton;

@interface MMFavoritesCircleView : UIView
@property (strong, nonatomic) UIColor *fillColor;
@property (assign, nonatomic) CGFloat radius;
@property (assign, nonatomic) CGFloat lineWidth;
@property (strong, nonatomic) CAShapeLayer *ringLayer;

+ (instancetype)createCircleWithButton:(MMFavoritesButton *)button
                                radius:(CGFloat)radius
                             lineWidth:(CGFloat)lineWidth
                             fillColor:(UIColor *)color;

- (instancetype)initWithRadius:(CGFloat)radius
                     lineWidth:(CGFloat)lineWidth
                     fillColor:(UIColor *)color;

- (void)animateToRadius:(CGFloat)radius
                toColor:(UIColor *)toColor
               duration:(CGFloat)duration
                  delay:(CGFloat)delay;

- (void)animateCollapseWithRadius:(CGFloat)radius
                         duration:(CGFloat)duration
                            delay:(CGFloat)delay;

- (instancetype)initWithCoder:(NSCoder *)aDecoder;

@end
