#import "THPlaybackViewController.h"
#import "HCYoutubeParser.h"
#import "THPlayerViewController.h"
#import "UIAlertView+THAdditions.h"

#define YOUTUBE_URL @"http://www.youtube.com/watch?v=6dNryy5elc8"

#define LOCAL_SEGUE        @"localSegue"
#define STREAMING_SEGUE @"streamingSegue"

@interface THPlaybackViewController ()
@property (nonatomic, strong) NSURL *localURL;
@property (nonatomic, strong) NSURL *streamingURL;
@end

@implementation THPlaybackViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Init local asset
    self.localURL = [[NSBundle mainBundle] URLForResource:@"hubblecast" withExtension:@"m4v"];

    // Init streaming asset
    [HCYoutubeParser h264videosWithYoutubeURL:[NSURL URLWithString:YOUTUBE_URL] completeBlock:^(NSDictionary *urls, NSError *error) {
        self.streamingURL = [NSURL URLWithString:urls[@"hd720"]];
    }];
    
    //self.streamingURL = [NSURL URLWithString:YOUTUBE_URL];
    
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
    [UIAlertView showAlertWithTitle:@"Asset Unavailable"
                            message:@"The requested asset could not be loaded."];
    return NO;
}

@end
