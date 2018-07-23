#import "MMFavoritesIconView.h"
#import "UIView+FrameExtension.h"
#import "Easing.h"

@interface MMFavoritesIconView()

@property (strong, nonatomic) UIColor *iconColor;
@property (strong, nonatomic) UIImage *iconImage;
@property (strong, nonatomic) CAShapeLayer *iconLayer;
@property (strong, nonatomic) CALayer *iconMask;
@property (assign, nonatomic) CGRect contentRegion;
@property (copy, nonatomic) NSArray *values;

@end

@implementation MMFavoritesIconView

+ (instancetype)createFavoritesIconOnView:(UIView *)view
                                     icon:(UIImage *)icon
                                    color:(UIColor *)color
{
    MMFavoritesIconView *favoritesIcon = [[MMFavoritesIconView alloc] initWithFrame: view.bounds
                                                                               icon: icon
                                                                              color: color];
    view.backgroundColor = [UIColor clearColor];
    [view addSubview: favoritesIcon];
    favoritesIcon.center = CGPointMake(view.bounds.size.width / 2, view.bounds.size.height / 2);
    
    return favoritesIcon;
}

- (instancetype)initWithFrame:(CGRect)region
                         icon:(UIImage *)icon
                        color:(UIColor *)color
{
    self = [super initWithFrame: CGRectZero];
    if(self)
    {
        _iconColor = color;
        _iconImage = icon;
        _contentRegion = region;
        
        [self applyInit];
    }
    
    return self;
}

- (void)applyInit
{
    CGPoint center = [self centerInRect: _contentRegion];
    CGRect maskRegion = [self rect: _contentRegion scaleBy: 0.7 rectCenteredAt: center];
    CGPoint shapeOrigin = CGPointMake(-center.x, -center.y);
    
    _iconMask = [CALayer layer];
    _iconMask.contents = (__bridge id)_iconImage.CGImage;
    _iconMask.contentsScale = [UIScreen mainScreen].scale;
    _iconMask.bounds = maskRegion;
    
    _iconLayer = [CAShapeLayer layer];
    _iconLayer.fillColor = _iconColor.CGColor;
    _iconLayer.path = [UIBezierPath bezierPathWithRect: CGRectMake(shapeOrigin.x, shapeOrigin.y, _contentRegion.size.width, _contentRegion.size.height)].CGPath;
    _iconLayer.mask = _iconMask;
    
    [self.layer addSublayer:_iconLayer];
}

- (void)selectWithoutAnimation:(BOOL)selected
                     fillColor:(UIColor *)color
{
    self.iconLayer.fillColor = color.CGColor;
}

- (void)animationSelect:(BOOL)selected
              fillColor:(UIColor *)color
               duration:(CGFloat)duration
                  delay:(CGFloat)delay
{
    if (_values == nil)
    {
        _values = [self generateValuesFrom: 0
                                        to: 1.0
                                  duration: duration];
    }
    
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    self.iconLayer.fillColor = color.CGColor;
    [CATransaction commit];
    
    CGFloat selectedDelay = selected ? delay : 0;
    
    if (selected)
    {
        self.alpha = 0.0;
        [UIView animateWithDuration: 0
                              delay: selectedDelay
                            options: UIViewAnimationOptionCurveLinear
                         animations:^{
                             self.alpha = 1.0;
                         } completion: nil];
    }
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath: @"transform.scale"];
    scaleAnimation.values = _values;
    scaleAnimation.duration = duration;
    scaleAnimation.beginTime = CACurrentMediaTime() + selectedDelay;
    [self.iconMask addAnimation: scaleAnimation forKey: nil];
}

- (NSArray *)generateValuesFrom:(CGFloat)fromValue
                             to:(CGFloat)toValue
                       duration:(CGFloat)duration
{
    NSMutableArray *mArray = [NSMutableArray array];
    CGFloat fps = 60;
    CGFloat tpf = duration / fps;
    CGFloat c = toValue - fromValue;
    CGFloat d = duration;
    CGFloat t = 0.0;
    
    while (t < d) {
        CGFloat scale = ElasticEaseOut(t, fromValue, c, d, c + 0.001, 0.39988);
        [mArray addObject:@(scale)];
        t += tpf;
    }
    
    return [mArray copy];
}

- (CGRect)rect:(CGRect)rect scaleBy:(CGFloat)scale rectCenteredAt:(CGPoint)center
{
    CGFloat dx = rect.size.width / 2;
    CGFloat dy = rect.size.height / 2;
    CGPoint origin = CGPointMake(center.x - dx, center.y - dy);
    
    return CGRectMake(origin.x, origin.y, rect.size.width*scale, rect.size.height*scale);
}

- (CGPoint)centerInRect:(CGRect)rect
{
    return CGPointMake(rect.size.width / 2, rect.size.height / 2);
}

@end
