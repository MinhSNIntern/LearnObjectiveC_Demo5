//
//  ViewController.m
//  Demo5
//
//  Created by vfa on 8/16/22.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIProgressView *progress;
@property (nonatomic,strong) UILabel *label;
@end

@implementation ViewController
- (NSAttributedString *) attributedText{
    NSString *string =@"Hello IOS";
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc] initWithString:string];
    NSDictionary *attributesForFirstWord = @{
        NSFontAttributeName:[UIFont boldSystemFontOfSize:60.0f],
        NSForegroundColorAttributeName: [UIColor redColor],
        NSBackgroundColorAttributeName: [UIColor blackColor]
    };
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor darkGrayColor];
    shadow.shadowOffset = CGSizeMake(4, 4);
    
    NSDictionary *attributesForSecondWord = @{
        NSFontAttributeName:[UIFont boldSystemFontOfSize:60.0f],
        NSForegroundColorAttributeName: [UIColor whiteColor],
        NSBackgroundColorAttributeName: [UIColor redColor]
    };
    
    [result setAttributes:attributesForFirstWord range:[string rangeOfString:@"Hello"]];
    [result setAttributes:attributesForSecondWord range:[string rangeOfString:@"IOS"]];
    
    return [[NSAttributedString alloc] initWithAttributedString:result];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.progress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    self.progress.center = self.view.center;
    self.progress.progress = 20.0f/30.0f;
    [self.view addSubview:self.progress];
    // Do any additional setup after loading the view.
    
    //style text
    self.label = [[UILabel alloc] init];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.attributedText = [self attributedText];
    [self.label sizeToFit];
    self.label.center = CGPointMake(self.view.frame.size.width/2, 200);
    [self.view addSubview:self.label];
}


@end
