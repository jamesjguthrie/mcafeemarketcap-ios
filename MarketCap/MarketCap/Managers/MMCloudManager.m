#import "MMCloudManager.h"

@implementation MMCloudManager

+ (id)sharedSession {
    static MMCloudManager *cloudManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cloudManager = [[self alloc] init];
    });
    
    return cloudManager;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        VPSocketLogger *logger = [VPSocketLogger new];
        NSString *urlString = @"https://mcafeemarketcap.com:443";
        NSDictionary *connectParams = @{@"EIO": @"3"};
        self.socket = [[VPSocketIOClient alloc] init: [NSURL URLWithString: urlString]
                                          withConfig: @{//@"log": @YES,
                                                       @"forcePolling": @YES,
                                                       @"secure": @YES,
                                                       @"forceNew": @YES,
                                                       @"forceWebsockets": @NO,
                                                       @"selfSigned": @YES,
                                                       @"reconnectWait": @1000,
                                                       //@"nsp":@"/socket.io",
                                                       @"connectParams": connectParams,
                                                       @"logger": logger}];
    }
    
    return self;
}

@end
