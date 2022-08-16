//
//  ViewController.m
//  Demo5MasterDetail
//
//  Created by vfa on 8/16/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageLabel.text = self.strLabel;
    [self.pageLabel
     sizeToFit];
    self.pageLabel.center = self.view.center;    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
