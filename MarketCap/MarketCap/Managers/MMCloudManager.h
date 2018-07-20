#import <Foundation/Foundation.h>
#import "MMDataReceiverProtocol.h"

@interface MMCloudManager : NSObject

@property(strong, nonatomic) AFURLSessionManager *sessionManager;
@property(weak, nonatomic) id<MMDataReceiverProtocol>dataProtocol;
+ (id)sharedSession;
- (void)generateDataTaskWithURL:(NSString *)url;
- (void)setDataDelegate:(id<MMDataReceiverProtocol>)delegate;

@end
