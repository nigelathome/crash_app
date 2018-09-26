#import "THPlaybackViewController.h"
#import "THPlayerViewController.h"
#import "UIAlertView+THAdditions.h"

#define YOUTUBE_URL @"http://www.youtube.com/watch?v=6dNryy5elc8"

#define LOCAL_SEGUE        @"localSegue"
#define STREAMING_SEGUE @"streamingSegue"
static NSInteger secondsCountDown = 5;

@interface THPlaybackViewController ()

@property (nonatomic, strong) NSURL *localURL;
@property (nonatomic, strong) NSURL *streamingURL;
@property(nonatomic,strong) NSTimer *countDownTimer;
@end

@implementation THPlaybackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownAction) userInfo:nil repeats:YES];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:LOCAL_SEGUE] && !self.localURL) {
        return [self alertError];
    } else if ([identifier isEqualToString:STREAMING_SEGUE] && !self.streamingURL) {
        return [self alertError];
    }
    
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSURL *url = [segue.identifier isEqualToString:LOCAL_SEGUE] ? self.localURL : self.streamingURL;
    THPlayerViewController *controller = [segue destinationViewController];
    controller.assetURL = url;
}

- (BOOL)alertError {
//    [UIAlertView showAlertWithTitle:@"Asset Unavailable"
//                            message:@"The requested asset could not be loaded."];
    return NO;
}

-(void)countDownAction {
    NSString *format_time = [NSString stringWithFormat:@"%@", @(secondsCountDown)];
    //修改倒计时标签及显示内容
    self.localLabel.text = [NSString stringWithFormat:@"即将闪退：%@", format_time];
    //当倒计时
    if(secondsCountDown == -1)
        [self makeCrash];
    else
        secondsCountDown-- ;
}

- (void)makeCrash {
    THPlayerViewController *playerVC = [[THPlayerViewController alloc] init];
    playerVC.controller = [[THPlayerController alloc] init];
    UIView *playerView = playerVC.controller.view;
    if ([playerVC.controller isKindOfClass:[THPlayerController class]])
        [playerVC.controller trigerCrash];
}

@end
