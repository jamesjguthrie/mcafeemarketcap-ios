#import <Foundation/Foundation.h>

@interface MMCoinModel : NSObject

@property(nonatomic, strong) UIImageView *coinImage;
@property(nonatomic, strong) NSString *coinName;
@property(nonatomic, strong) NSString *coinSymbol;
@property(nonatomic, strong) NSString *coinPrice;
@property(nonatomic, strong) NSString *percentageChange;

- (instancetype)initWithName:(NSString *)coinName
                  coinSymbol:(NSString *)coinSymbol
                   coinPrice:(NSString *)coinPrice
               percentChange:(NSString *)percentage;

- (instancetype)initWithImage:(UIImageView *)image
                         name:(NSString *)coinName
                   coinSymbol:(NSString *)coinSymbol
                    coinPrice:(NSString *)coinPrice
                percentChange:(NSString *)percentage;

@end
