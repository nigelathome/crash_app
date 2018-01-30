@protocol THSubtitleViewControllerDelegate <NSObject>
- (void)subtitleSelected:(NSString *)subtitle;
@end

@interface THSubtitleViewController : UIViewController

- (id)initWithSubtitles:(NSArray *)subtitles;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString *selectedSubtitle;
@property (weak, nonatomic) id<THSubtitleViewControllerDelegate> delegate;
- (IBAction)close:(id)sender;

@end
