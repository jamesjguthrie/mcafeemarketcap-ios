#import <Foundation/Foundation.h>

@interface MMPreferencesManager : NSObject

+ (instancetype)sharedManager;
- (void)saveObject:(id)object forKey:(NSString *)key;
- (id)objectForKey:(NSString *)key;

@end
