#import "THPlayerViewController.h"
#import "THPlayerController.h"

@interface THPlayerViewController ()
@property (strong, nonatomic) THPlayerController *controller;
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
