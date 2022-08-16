//
//  PageViewController.m
//  Demo5MasterDetail
//
//  Created by vfa on 8/16/22.
//

#import "PageViewController.h"
#import "ViewController.h"
@interface PageViewController ()
{
    NSArray *items;
}
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    items = @[@"Page 1",@"Page 2",@"Page 3",@"Page 4",@"Page 5"];
    // Do any additional setup after loading the view.
    self.dataSource = self;
    ViewController *initVC = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObjects:initVC, nil];
    
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(UIViewController *) viewControllerAtIndex: (NSInteger) index{
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    viewController.strLabel = items[index];
    viewController.pageIndex = index;
    return viewController;
}

- (nullable UIViewController *)pageViewController:(nonnull UIPageViewController *)pageViewController viewControllerAfterViewController:(nonnull UIViewController *)viewController {
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    if(index==0 || index == NSNotFound){
        return  nil;
    }
    index --;
    return [self viewControllerAtIndex:index];
}

- (nullable UIViewController *)pageViewController:(nonnull UIPageViewController *)pageViewController viewControllerBeforeViewController:(nonnull UIViewController *)viewController {
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    if(index==NSNotFound){return nil;}
    index++;
    if(index == items.count){return nil;}
    return [self viewControllerAtIndex:index];
}


@end
