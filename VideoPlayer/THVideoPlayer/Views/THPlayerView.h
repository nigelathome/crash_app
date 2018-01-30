#import "THTransport.h"

@class AVPlayer;

@interface THPlayerView : UIView

- (id)initWithPlayer:(AVPlayer *)player;

@property (nonatomic, readonly) id <THTransport> transport;

@end
