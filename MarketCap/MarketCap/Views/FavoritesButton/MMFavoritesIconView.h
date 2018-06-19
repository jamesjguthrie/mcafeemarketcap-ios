@interface MMFavoritesIconView : UIView

+ (instancetype)createFavoritesIconOnView:(UIView *)view
                                     icon:(UIImage *)icon
                                    color:(UIColor *)color;

- (void)animationSelect:(BOOL)selected
              fillColor:(UIColor *)color
               duration:(CGFloat)duration
                  delay:(CGFloat)delay;
@end
