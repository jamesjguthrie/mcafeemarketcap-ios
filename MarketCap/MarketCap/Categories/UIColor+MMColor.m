#import "UIColor+MMColor.h"

@implementation UIColor (MMColor)

- (CGFloat)alpha
{
    CGFloat red = 0;
    CGFloat green = 0;
    CGFloat blue = 0;
    CGFloat alpha = 0;
    [self getRed: &red green: &green blue: &blue alpha: &alpha];
    return alpha;
}

+ (UIColor *)MMcolorFromRGBHexString:(NSString *)hex
{
    NSAssert(hex.length == 6, @"Hex strings should be 6 characters long");
    
    CGFloat red, green, blue;
    [self extractRed: &red
               green: &green
                blue: &blue
       fromHexString: hex];
    return [UIColor colorWithRed: red green: green blue: blue alpha: 1.0];
}

+ (void)extractRed:(CGFloat*)red
             green:(CGFloat*)green
              blue:(CGFloat*)blue
     fromHexString:(NSString *)hex
{
    NSAssert(hex.length == 6, @"Hex string should be 6 characters long");
    
    NSString *firstTwo = [hex substringWithRange: NSMakeRange(0, 2)];
    NSString *secondTwo = [hex substringWithRange: NSMakeRange(2, 2)];
    NSString *thirdTwo = [hex substringWithRange: NSMakeRange(4, 2)];
    
    unsigned int redValue;
    [[NSScanner scannerWithString: firstTwo] scanHexInt: &redValue];
    *red = ((CGFloat)redValue) / 255.0;
    
    unsigned int greenValue;
    [[NSScanner scannerWithString: secondTwo] scanHexInt: &greenValue];
    *green = ((CGFloat)greenValue) / 255.0;
    
    unsigned int blueValue;
    [[NSScanner scannerWithString: thirdTwo] scanHexInt: &blueValue];
    *blue = ((CGFloat)blueValue) / 255.0;
}

+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString: hexString];
    if ([hexString hasPrefix: @"#"])
    {
        [scanner setScanLocation: 1];
    }
    [scanner scanHexInt: &rgbValue];
    return [UIColor colorWithRed: ((rgbValue & 0xFF0000) >> 16) / 255.0 green: ((rgbValue & 0xFF00) >> 8) / 255.0 blue: (rgbValue & 0xFF) / 255.0 alpha: 1.0];
}

- (NSString *) UIColorToHexString:(UIColor *)uiColor
{
    CGColorRef color = [uiColor CGColor];
    
    size_t numComponents = CGColorGetNumberOfComponents(color);
    int red,green,blue, alpha;
    const CGFloat *components = CGColorGetComponents(color);
    if (numComponents == 4)
    {
        red =  (int)(components[0] * 255.0) ;
        green = (int)(components[1] * 255.0);
        blue = (int)(components[2] * 255.0);
        alpha = (int)(components[3] * 255.0);
    }
    else
    {
        red = (int)(components[0] * 255.0);
        green = (int)(components[0] * 255.0);
        blue = (int)(components[0] * 255.0);
        alpha = (int)(components[1] * 255.0);
    }
    
    NSString *hexString = [NSString stringWithFormat: @"#%02x%02x%02x%02x", alpha, red, green, blue];
    return hexString;
}

@end

