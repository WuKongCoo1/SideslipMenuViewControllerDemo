//
//  MenuViewController.h
//  ChildViewControllerDemo
//
//  Created by 吴珂 on 16/1/25.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuViewController;
@protocol MenuViewControllerDelegate <NSObject>

- (void)menuViewController:(MenuViewController *)controller didSelectAtIndexPath:(NSIndexPath * )indexPath;

@end

@interface MenuViewController : UITableViewController

@property (nonatomic, assign) id<MenuViewControllerDelegate> delegate;

@end
