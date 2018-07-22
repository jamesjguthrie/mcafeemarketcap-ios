#import <Foundation/Foundation.h>

@interface MMTheme : NSObject

@property (strong, nonatomic) UIColor *backgroundColor;
@property (strong, nonatomic) UIColor *tabBarColor;
@property (strong, nonatomic) UIColor *fontColor;
@property (strong, nonatomic) UIColor *lineSeparatorColor;
@property (strong, nonatomic) UIColor *watchListUnselectedColor;
@property (assign) UIStatusBarStyle statusBarStyle;

@end


