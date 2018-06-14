#import "MMFavoritesCircleView.h"
#import "MMFavoritesButton.h"
#import "UIView+FrameExtension.h"

@interface MMFavoritesCircleView()<CAAnimationDelegate>

@end

@implementation MMFavoritesCircleView

+ (instancetype)createCircleWithButton:(MMFavoritesButton *)button
                                radius:(CGFloat)radius
                             lineWidth:(CGFloat)lineWidth
                             fillColor:(UIColor *)color
{
    MMFavoritesCircleView *circle = [[MMFavoritesCircleView alloc] initWithRadius: radius
                                                                        lineWidth: lineWidth
                                                                        fillColor: color];
    circle.backgroundColor = [UIColor clearColor];
    [button.superview insertSubview: circle belowSubview: button];
    circle.center = button.center;
    
    return circle;
}

- (instancetype)initWithRadius:(CGFloat)radius
                     lineWidth:(CGFloat)lineWidth
                     fillColor:(UIColor *)color
{
    if (self = [super initWithFrame: CGRectZero])
    {
        _fillColor = color;
        _radius = radius;
        _lineWidth = lineWidth;
        
        [self applyInit];
    }
    
    return self;
}

- (void)applyInit
{
    UIView *centerView = [[UIView alloc] initWithFrame: CGRectZero];
    [self addSubview: centerView];
    centerView.backgroundColor = [UIColor clearColor];
    centerView.center = self.center;
    centerView.width = self.width;
    centerView.height = self.height;
    
    CAShapeLayer *circle = [self createRingLayerWithRadius: _radius
                                                 lineWidth: _lineWidth
                                                 fillColor: [UIColor clearColor]
                                               strokeColor: _fillColor];
    [centerView.layer addSublayer: circle];
    self.ringLayer = circle;
}

- (CAShapeLayer *)createRingLayerWithRadius:(CGFloat)radius
                                  lineWidth:(CGFloat)lineWidth
                                  fillColor:(UIColor *)fillColor
                                strokeColor:(UIColor *)strokeColor
{
    UIBezierPath *circularPath = [UIBezierPath bezierPathWithArcCenter: CGPointZero
                                                                radius: radius - _lineWidth / 2
                                                            startAngle: 0
                                                              endAngle: 2 * M_PI
                                                             clockwise: YES];
    CAShapeLayer *circularLayer = [[CAShapeLayer alloc] init];
    circularLayer.path = circularPath.CGPath;
    circularLayer.fillColor = fillColor.CGColor;
    circularLayer.lineWidth = 3;
    circularLayer.strokeColor = strokeColor.CGColor;
    
    return circularLayer;
}

- (void)animateToRadius:(CGFloat)radius
                toColor:(UIColor *)toColor
               duration:(CGFloat)duration
                  delay:(CGFloat)delay
{
    [self layoutIfNeeded];
    
    self.width = radius * 2;
    self.height = radius * 2;
    
    CGFloat fittedRadius = radius - _lineWidth / 2;
    
    CABasicAnimation *fillColorAnimation = [self animationFillColorFrom: self.fillColor
                                                                toColor: toColor
                                                               duration: duration
                                                                  delay: delay];
    CABasicAnimation *lineWidthAnimation = [self animationLineWidth: _lineWidth
                                                           duration: duration
                                                              delay: delay];
    CABasicAnimation *lineColorAnimation = [self animationStrokeColor: toColor
                                                             duration: duration
                                                                delay: delay];
    CABasicAnimation *circlePathAnimation = [self animationCirclePath: fittedRadius
                                                             duration: duration
                                                                delay: delay];
    
    [UIView animateWithDuration: duration
                          delay: delay
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self layoutIfNeeded];
                     } completion: nil];
    
    [self.ringLayer addAnimation: fillColorAnimation forKey: nil];
    [self.ringLayer addAnimation: lineWidthAnimation forKey: nil];
    [self.ringLayer addAnimation: lineColorAnimation forKey: nil];
    [self.ringLayer addAnimation: circlePathAnimation forKey: nil];
}

- (void)animateCollapseWithRadius:(CGFloat)radius
                         duration:(CGFloat)duration
                            delay:(CGFloat)delay
{
    static NSString *mCollapseAnimation = @"collapseAnimation";
    
    CABasicAnimation *lineWidthAnimation = [self animationLineWidth: 0
                                                           duration: duration
                                                              delay: delay];
    CABasicAnimation *circlePathAnimation = [self animationCirclePath: radius
                                                             duration: duration
                                                                delay: delay];
    circlePathAnimation.delegate = self;
    [circlePathAnimation setValue: mCollapseAnimation forKey: mCollapseAnimation];
    [self.ringLayer addAnimation: lineWidthAnimation forKey: nil];
    [self.ringLayer addAnimation: circlePathAnimation forKey: nil];
}

- (CABasicAnimation *)animationFillColorFrom:(UIColor *)fromColor
                                     toColor:(UIColor *)toColor
                                    duration:(CGFloat)duration
                                       delay:(CGFloat)delay
{
    static NSString *mFillColorKey = @"fillColor";
    
    CABasicAnimation *fillColorAnimaiton = [CABasicAnimation animationWithKeyPath: mFillColorKey];
    fillColorAnimaiton.fromValue = (__bridge id)(fromColor.CGColor);
    fillColorAnimaiton.toValue = (__bridge id)(toColor.CGColor);
    fillColorAnimaiton.duration = duration;
    fillColorAnimaiton.beginTime = CACurrentMediaTime() + delay;
    fillColorAnimaiton.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    
    return fillColorAnimaiton;
}

- (CABasicAnimation *)animationStrokeColor:(UIColor *)strokeColor
                                  duration:(CGFloat)duration
                                     delay:(CGFloat)delay
{
    static NSString *mStrokeColorKey = @"fillColor";
    
    CABasicAnimation *strokeColorAnimation = [CABasicAnimation animationWithKeyPath: mStrokeColorKey];
    strokeColorAnimation.toValue = (__bridge id _Nullable)(strokeColor.CGColor);
    strokeColorAnimation.duration = duration;
    strokeColorAnimation.beginTime = CACurrentMediaTime() + delay;
    strokeColorAnimation.fillMode = kCAFillModeForwards;
    strokeColorAnimation.removedOnCompletion = NO;
    strokeColorAnimation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    
    return strokeColorAnimation;
}

- (CABasicAnimation *)animationLineWidth:(CGFloat)lineWidth
                                duration:(CGFloat)duration
                                   delay:(CGFloat)delay
{
    static NSString *mLineWidthKey = @"lineWidth";
    
    CABasicAnimation *lineWidthAnimation = [CABasicAnimation animationWithKeyPath: mLineWidthKey];
    lineWidthAnimation.toValue = @(lineWidth);
    lineWidthAnimation.duration = duration;
    lineWidthAnimation.beginTime = CACurrentMediaTime() + delay;
    lineWidthAnimation.fillMode = kCAFillModeForwards;
    lineWidthAnimation.removedOnCompletion = NO;
    lineWidthAnimation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    
    return lineWidthAnimation;
}

- (CABasicAnimation *)animationCirclePath:(CGFloat)radius
                                 duration:(CGFloat)duration
                                    delay:(CGFloat)delay
{
    static NSString *mPathKey = @"path";
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter: CGPointZero
                                                        radius: radius
                                                    startAngle: 0
                                                      endAngle: 2 * M_PI
                                                     clockwise: YES];
    
    CABasicAnimation *circleAnimation = [CABasicAnimation animationWithKeyPath: mPathKey];
    circleAnimation.toValue = (__bridge id _Nullable)(path.CGPath);
    circleAnimation.duration = duration;
    circleAnimation.beginTime = CACurrentMediaTime() + delay;
    circleAnimation.fillMode = kCAFillModeForwards;
    circleAnimation.removedOnCompletion = NO;
    circleAnimation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    
    return circleAnimation;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    static NSString *mCollapseAnimation = @"collapseAnimation";
    
    if ([anim valueForKey: mCollapseAnimation])
    {
        [self removeFromSuperview];
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSAssert(false, @"initWithCoder not implemented");
    return nil;
}

@end
