#import <Foundation/Foundation.h>
#import "MMDayTheme.h"
#import "MMNightTheme.h"

@interface MMThemeManager : NSObject

@property(strong, nonatomic) MMTheme *selectedTheme;
@property(strong, nonatomic) MMDayTheme *dayTheme;
@property(strong, nonatomic) MMNightTheme *nightTheme;

+ (MMThemeManager *)sharedManager;
- (void)switchCurrentTheme;

@end
