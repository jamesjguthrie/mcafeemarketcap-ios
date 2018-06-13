#import "UpwardIndicator.h"

@implementation UpwardIndicator

- (void)drawRect:(CGRect)rect
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGRect bounds = self.bounds;
    CGFloat radius = (bounds.size.width - 6) / 2;
    CGFloat a = radius * sqrt((CGFloat)3.0) / 2;
    CGFloat b = radius / 2;
    [path moveToPoint:CGPointMake(0, -radius)];
    [path addLineToPoint:CGPointMake(a, b)];
    [path addLineToPoint:CGPointMake(-a, b)];
    
    [path closePath];
    [path applyTransform:CGAffineTransformMakeTranslation(CGRectGetMidX(bounds), CGRectGetMidY(bounds))];
    shapeLayer.path = path.CGPath;
    
    shapeLayer.fillColor = [UIColor colorWithRed: 22.0 / 255.0 green: 163.0 / 255.0 blue: 19.0 / 255.0 alpha: 1.0].CGColor;
    [self.layer addSublayer: shapeLayer];
}

@end
