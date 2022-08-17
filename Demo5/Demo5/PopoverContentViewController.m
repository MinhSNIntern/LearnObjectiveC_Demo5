//
//  PopoverContentViewController.m
//  Demo5
//
//  Created by vfa on 8/17/22.
//

#import "PopoverContentViewController.h"

@interface PopoverContentViewController ()
@property (nonatomic,strong) UIButton *btnPhoto;
@property (nonatomic,strong) UIButton *btnAudio;
@end

@implementation PopoverContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.preferredContentSize = CGSizeMake(200, 125);
    
    CGRect btnRect = CGRectMake(20, 20, 160, 37);
    
    self.btnPhoto = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.btnPhoto setTitle:@"Photo" forState:UIControlStateNormal];
    [self.btnPhoto addTarget:self action:@selector(gotoAppleWebsite:) forControlEvents:UIControlEventTouchUpInside];
    self.btnPhoto.frame = btnRect;
    
    [self.view addSubview:self.btnPhoto];
    
    btnRect.origin.y +=50;
    
    self.btnAudio = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.btnAudio setTitle:@"Audio" forState:UIControlStateNormal];
    [self.btnAudio addTarget:self action:@selector(gotoAppleStoreWebsite:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnAudio.frame = btnRect;
    
    [self.view addSubview:self.btnAudio];
    // Do any additional setup after loading the view.
}
-(void) gotoAppleWebsite:(id) paramSender{
    if([self isInPopover]){
    [self.popoverController dismissPopoverAnimated:YES];
    }
    else{
        
    }
}
-(void) gotoAppleStoreWebsite:(id) paramSender{
    if([self isInPopover]){
    [self.popoverController dismissPopoverAnimated:YES];
    }
    else{
        
    }
}
- (BOOL) isInPopover{
    
    Class popoverClass = NSClassFromString(@"UIPopoverController");
    
    if(popoverClass != nil && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && self.popoverController !=nil){
        return YES;
    }
    else {
        return NO;
    }
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
