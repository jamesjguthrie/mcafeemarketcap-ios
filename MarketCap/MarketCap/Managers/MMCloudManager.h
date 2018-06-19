@interface MMCloudManager : NSObject
{
    VPSocketIOClient *_socket;
}

@property(retain, nonatomic) VPSocketIOClient *socket;

+ (id)sharedSession;

@end
