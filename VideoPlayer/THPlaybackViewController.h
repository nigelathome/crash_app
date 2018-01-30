@interface THPlaybackViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *localPlaybackButton;
@property (weak, nonatomic) IBOutlet UIButton *remotePlaybackButton;

@property (weak, nonatomic) IBOutlet UILabel *remoteLabel;
@property (weak, nonatomic) IBOutlet UILabel *localLabel;

@end
