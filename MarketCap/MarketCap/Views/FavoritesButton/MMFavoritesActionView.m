#import "MMFavoritesActionView.h"
#import "MMFavoritesButton.h"
#import "UIView+FrameExtension.h"

@implementation DotRadius

- (id)copyWithZone:(NSZone *)zone
{
    DotRadius *dotRadius = [DotRadius new];
    dotRadius->first = first;
    dotRadius->second = second;
    
    return dotRadius;
}

@end

@implementation MMFavoritesActionView
+ (instancetype)createFavoriteButtonFlare:(MMFavoritesButton *)favoritesButton
                                   radius:(CGFloat)radius
                               firstColor:(UIColor *)firstColor
                              secondColor:(UIColor *)secondColor
                                    angle:(CGFloat)angle
                                dotRadius:(DotRadius *)dotRadius
{
    MMFavoritesActionView *flare = [[MMFavoritesActionView alloc] initWithRadius: radius
                                                                      firstColor: firstColor
                                                                     secondColor: secondColor
                                                                           angle: angle
                                                                       dotRadius: dotRadius];
    
    [favoritesButton.superview insertSubview: flare belowSubview: favoritesButton];
    
    flare.backgroundColor = [UIColor clearColor];
    flare.alpha = 0.0;
    flare.width = dotRadius->first * 2.0 + dotRadius->second * 2.0 + distanceHorizontal;
    flare.height = radius + dotRadius->first * 2.0 + dotRadius->second * 2.0;
    flare.center = favoritesButton.center;
    flare.layer.anchorPoint = CGPointMake(0.5, 1.0);
    flare.transform = CGAffineTransformMakeRotation(angle * M_PI / 180);
    
    return flare;
}

- (instancetype)initWithRadius:(CGFloat)radius
                    firstColor:(UIColor *)firstColor
                   secondColor:(UIColor *)secondColor
                         angle:(CGFloat)angle
                     dotRadius:(DotRadius *)dotRadius
{
    self = [super initWithFrame: CGRectZero];
    if (self)
    {
        _radius = radius;
        _firstColor = firstColor;
        _secondColor = secondColor;
        _angle = angle;
        _dotRadius = [dotRadius copy];
        
        [self applyInit];
    }
    
    return self;
}

- (void)applyInit
{
    _dotFirst = [self createDotViewWithRadius: _dotRadius->first fillColor: _firstColor];
    _dotSecond = [self createDotViewWithRadius: _dotRadius->second fillColor: _secondColor];
    
    _dotFirst.width = _dotRadius->first * 2;
    _dotFirst.height = _dotRadius->first * 2;
    _dotFirst.right = self.right + 10;
    _dotFirst.top = self.top;
    
    _dotSecond.width = _dotRadius->second * 2;
    _dotSecond.height = _dotRadius->second * 2;
    _dotSecond.left = self.left;
    _dotSecond.top = self.top + _dotRadius->first * 2.0;
}

- (UIView *)createDotViewWithRadius:(CGFloat)radius
                          fillColor:(UIColor *)fillColor
{
    UIView *dotView = [[UIView alloc] initWithFrame: CGRectZero];
    dotView.backgroundColor = fillColor;
    dotView.layer.cornerRadius = radius;
    [self addSubview: dotView];
    
    return dotView;
}

- (void)animateIgniteShowWithRadius:(CGFloat)radius
                           duration:(CGFloat)duration
                              delay:(CGFloat)delay
{
    CGFloat diameter = _dotRadius->first + _dotRadius->second;
    CGFloat height = diameter + distanceVertical;
    
    [UIView animateWithDuration: 0 animations:^{
        self.alpha = 1.0;
    }];
    
    [UIView animateWithDuration: duration * .7
                          delay: delay
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGRect bound = self.bounds;
                         bound.size.height = height + 10;
                         self.bounds = bound;
                     } completion: nil];
}

- (void)animateIgniteHideWithDuration:(CGFloat)duration delay:(CGFloat)delay
{
    [UIView animateWithDuration: duration
                          delay: delay
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.dotSecond.backgroundColor = self.firstColor;
                         self.dotFirst.backgroundColor = self.secondColor;
                     } completion: nil];
    
    
    [UIView animateWithDuration: duration
                          delay: delay
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGRect bound = self.dotSecond.bounds;
                         bound.size.width = 0.0;
                         bound.size.height = 0.0;
                         self.dotSecond.bounds = bound;
                     } completion: nil];
    
    [UIView animateWithDuration: duration * 1.7
                          delay: delay
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         CGRect bound = self.dotFirst.bounds;
                         bound.size.width = 0.0;
                         bound.size.height = 0.0;
                         self.dotFirst.bounds = bound;
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSAssert(false, @"init(coder:) has not implemented");
    return nil;
}

@end

