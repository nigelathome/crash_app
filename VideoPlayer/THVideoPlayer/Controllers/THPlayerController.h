@interface THPlayerController : NSObject

- (id)initWithURL:(NSURL *)assetURL;

@property (strong, nonatomic, readonly) UIView *view;

- (void)trigerCrash;

@end
