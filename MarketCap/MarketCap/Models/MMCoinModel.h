#import <Foundation/Foundation.h>

@interface MMCoinModel : NSObject

@property(strong, nonatomic) UIImageView *coinImage;
@property(strong, nonatomic) NSString *coinName;
@property(strong, nonatomic) NSNumber *coinRank;
@property(strong, nonatomic) NSString *coinSymbol;
@property(strong, nonatomic) NSNumber *coinPrice;
@property(strong, nonatomic) NSNumber *percentChangeOneHour;
@property(strong, nonatomic) NSNumber *percentChangeTwentyFourHours;
@property(strong, nonatomic) NSNumber *percentChangeOneWeek;
@property(strong, nonatomic) NSNumber *percentageChange;

- (instancetype)initWithResponseData:(NSDictionary *)dictionary;

@end
