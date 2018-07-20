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
        self.sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration: [NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    
    return self;
}

- (void)setDataDelegate:(id<MMDataReceiverProtocol>)delegate
{
    self.dataProtocol = delegate;
}

- (void)generateDataTaskWithURL:(NSString *)url
{
    NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString: url]];
    
    NSURLSessionDataTask *dataTask = [self.sessionManager dataTaskWithRequest: request
                                      uploadProgress: nil
                                    downloadProgress: nil
                                   completionHandler: ^(NSURLResponse *response, id responseObject, NSError *error)
             {
                 if(error)
                 {
                     NSLog(@"HA");
                 }
                 else
                 {
                     [self.dataProtocol setData: responseObject];
                 }
             }];
    
    [dataTask resume];
}

@end
