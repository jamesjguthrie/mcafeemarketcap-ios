#import "MMThemeManager.h"
#import "MMPreferencesManager.h"
#import "UIColor+MMColor.h"

@interface MMThemeManager ()

@property (strong, nonatomic) MMPreferencesManager *preferencesManager;

@end

static NSString *const mSelectedTheme = @"selectedTheme";

@implementation MMThemeManager

+ (MMThemeManager *)sharedManager
{
    static MMThemeManager *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[MMThemeManager alloc] initWithPreferencesManager: [MMPreferencesManager sharedManager]];
        _sharedManager.dayTheme = [[MMDayTheme alloc] init];
        _sharedManager.nightTheme = [[MMNightTheme alloc] init];
        _sharedManager.selectedTheme = _sharedManager.dayTheme;
    });
    
    return _sharedManager;
}

- (instancetype)initWithPreferencesManager:(MMPreferencesManager *)preferencesManager
{
    self = [super init];
    if(self)
    {
        self.preferencesManager = preferencesManager;
    }
    
    return self;
}

- (void)switchCurrentTheme
{
    self.selectedTheme = [self.selectedTheme isKindOfClass: [MMDayTheme class]] ? self.nightTheme : self.dayTheme;
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

