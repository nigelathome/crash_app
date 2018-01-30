#import "AVAsset+THAdditions.h"

@implementation AVAsset (THAdditions)

- (NSString *)title {

    AVKeyValueStatus status =
        [self statusOfValueForKey:@"commonMetadata" error:nil];
    if (status == AVKeyValueStatusLoaded) {
        NSArray *items =
            [AVMetadataItem metadataItemsFromArray:self.commonMetadata
                                           withKey:AVMetadataCommonKeyTitle
                                          keySpace:AVMetadataKeySpaceCommon];
        if (items.count > 0) {
            AVMetadataItem *titleItem = [items firstObject];
            return (NSString *)titleItem.value;
        }
    }
    
    return nil;
}

@end
