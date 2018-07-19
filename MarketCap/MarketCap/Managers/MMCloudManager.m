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

    }
    
    return self;
}

@end
