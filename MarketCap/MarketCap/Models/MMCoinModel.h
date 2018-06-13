#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MMCoinModel : NSObject

@property(nonatomic, strong) UIImageView *coinImage;
@property(nonatomic, strong) NSString *coinName;
@property(nonatomic, strong) NSString *coinPrice;
@property(nonatomic, strong) NSString *percentageChange;

- (instancetype)initWithImage:(UIImageView *)image name:(NSString *)coinName coinPrice:(NSString *)coinPrice percentChange:(NSString *)percentage;

@end
