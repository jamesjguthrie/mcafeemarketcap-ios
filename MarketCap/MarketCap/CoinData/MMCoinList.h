#import <Foundation/Foundation.h>

@interface MMCoinList : NSObject

@property (strong, nonatomic) NSMutableArray *coins;
- (instancetype)initCoinList;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
