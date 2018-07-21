#import "MMThemeManager.h"
#import "UIColor+MMColor.h"

@implementation MMThemeManager

+ (MMThemeManager *)sharedManager
{
    static MMThemeManager *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[MMThemeManager alloc] init];
        _sharedManager.dayTheme = [[MMDayTheme alloc] init];
        _sharedManager.nightTheme = [[MMNightTheme alloc] init];
        _sharedManager.selectedTheme = _sharedManager.dayTheme;
    });
    
    return _sharedManager;
}

- (void)setDayTheme
{
    self.selectedTheme = self.dayTheme;
}

- (void)setNightTheme
{
    self.selectedTheme = self.nightTheme;
}

@end

