//
//  ViewController.h
//  Demo5MasterDetail
//
//  Created by vfa on 8/16/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *pageLabel;
@property NSString *strLabel;
@property NSUInteger pageIndex;
@end

NS_ASSUME_NONNULL_END
