//
//  ViewController.m
//  SlideslipViewControllerDemo
//
//  Created by 吴珂 on 16/1/23.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "SlideslipViewController.h"
#import "MenuViewController.h"
#import "DetailViewController.h"


@interface SlideslipViewController ()
<
UIScrollViewDelegate,
MenuViewControllerDelegate
>
@property (weak, nonatomic) IBOutlet UIView *menuViewContainer;
@property (weak, nonatomic) IBOutlet UIView *detailViewContainer;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation SlideslipViewController
{
    DetailViewController *_detailVC;
    MenuViewController *_menuVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view layoutIfNeeded];

    [self showOrHideMenuViewContainer:false animated:NO];
    
}

- (void)showOrHideMenuViewContainer:(BOOL)show animated:(BOOL)animated
{
    if (show) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:animated];
    }else{
        [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth(_menuViewContainer.bounds), 0) animated:animated];
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    scrollView.pagingEnabled = scrollView.contentOffset.x < (scrollView.contentSize.width - CGRectGetWidth(scrollView.frame));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.view];
    
    NSLog(@"%s %i %@", __func__ ,__LINE__,NSStringFromCGPoint(point));
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"menu"]) {
        _menuVC = segue.destinationViewController;
        _menuVC.delegate = self;
    }else if([segue.identifier isEqualToString:@"detail"]){
        _detailVC = segue.destinationViewController;
    }
}

- (void)menuViewController:(MenuViewController *)controller didSelectAtIndexPath:(NSIndexPath *)indexPath
{
    [self showOrHideMenuViewContainer:NO animated:YES];
    [_detailVC setIndexPath:indexPath];
}

@end
