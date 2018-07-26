#import "MMPreferencesManager.h"

static NSString *mEncodedObjectKey = @"encodedObject";

@implementation MMPreferencesManager

+ (instancetype)sharedManager
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[MMPreferencesManager alloc] init];
    });
    return sharedInstance;
}

- (NSData *)encodeObject:(id)object
{
    if (!object)
    {
        return nil;
    }
    
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData: data];
    [archiver encodeObject: object forKey: mEncodedObjectKey];
    [archiver finishEncoding];
    return data;
}

- (id)decodeObject:(NSData*)data
{
    if (!data)
    {
        return nil;
    }
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData: data];
    id object = [unarchiver decodeObjectForKey: mEncodedObjectKey];
    [unarchiver finishDecoding];
    return object;
}

+ (void)saveObjectToUserDefaults:(id)object withKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject: object forKey: key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)saveBool:(BOOL)value forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setBool: value forKey: key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)boolForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] boolForKey: key];
}

- (void)saveObject:(id)object forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject: object forKey: key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id)objectForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: key];
}

- (void)removeObjectForKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey: key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
