//
//  ViewController.m
//  Demo5
//
//  Created by vfa on 8/16/22.
//

#import "ViewController.h"
#import "PopoverContentViewController.h"

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
    
    Class popoverClass = NSClassFromString(@"UIPopoverController");
    if(popoverClass !=nil && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        PopoverContentViewController *content = [[PopoverContentViewController alloc] initWithNibName:nil bundle:nil];
        
        self.popoverController = [[UIPopoverController alloc] initWithContentViewController:content];
        content.popoverController = self.popoverController;
        self.barButtonAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(performAddWithPopover:)];
    }else{
        
        self.barButtonAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(performAddWithAlertView:)];
    }
    
    [self.navigationItem setRightBarButtonItem: self.barButtonAdd];
}
- (void) performAddWithPopover:(id) paramSender{
    
    [self.popoverController presentPopoverFromBarButtonItem:self.barButtonAdd permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
-(void) performAddWithAlertView:(id) paramSender{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add ..." message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionAddPhoto = [UIAlertAction actionWithTitle:@"Photo" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *actionAddAudio = [UIAlertAction actionWithTitle:@"Audio" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:actionAddPhoto];
    [alert addAction:actionAddAudio];
    [alert addAction:actionCancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}

@end
