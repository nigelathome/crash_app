#import "THPlayerViewController.h"

@interface THPlayerViewController ()

@end

@implementation THPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.controller = [[THPlayerController alloc] initWithURL:self.assetURL];
    UIView *playerView = self.controller.view;
    playerView.frame = self.view.frame;
    [self.view addSubview:playerView];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
