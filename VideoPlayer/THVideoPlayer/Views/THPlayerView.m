#import "THPlayerView.h"
#import "THOverlayView.h"
#import <AVFoundation/AVFoundation.h>

@interface THPlayerView ()
@property (strong, nonatomic) THOverlayView *overlayView;                   // 1
@end

@implementation THPlayerView

+ (Class)layerClass {                                                       // 2
    return [AVPlayerLayer class];
}

- (id)initWithPlayer:(AVPlayer *)player {
    self = [super initWithFrame:CGRectZero];                                // 3
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight |
                                UIViewAutoresizingFlexibleWidth;

        [(AVPlayerLayer *) [self layer] setPlayer:player];                  // 4

        [[NSBundle mainBundle] loadNibNamed:@"THOverlayView"                // 5
                                      owner:self
                                    options:nil];
        
        [self addSubview:_overlayView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.overlayView.frame = self.bounds;
}

- (id <THTransport>)transport {
    return self.overlayView;
}

@end
