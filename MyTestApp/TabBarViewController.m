//
//  TabBarViewController.m
//  MyTestApp
//
//  Created by Gatsby on 11/6/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "TabBarViewController.h"
#import "MainUITableViewController.h"
#import "MyNavigationController.h"
#import "SelfDetailTableViewController.h"
#import "HotTagTableViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyNavigationController *vc1 = [[MyNavigationController alloc] initWithRootViewController:[[MainUITableViewController alloc] init]];
    vc1.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc1.title = @"HOME";
    vc1.tabBarItem.image = [UIImage imageNamed:@"home.png"];
    
    UINavigationController *vc2 = [[UINavigationController alloc] initWithRootViewController:[[HotTagTableViewController alloc] init]];
    vc2.title = @"DISCOVER";
    vc2.tabBarItem.image = [UIImage imageNamed:@"discover.png"];
    UITabBarController *tabBarCtrl = [[UITabBarController alloc] init];
    
    UINavigationController *vc3 = [[UINavigationController alloc] initWithRootViewController:[[SelfDetailTableViewController alloc] init:@"@admin"]];
    vc3.title = @"ME";
    vc3.tabBarItem.image = [UIImage imageNamed:@"user.png"];
    tabBarCtrl.view.backgroundColor = [UIColor cyanColor];
    
    tabBarCtrl.viewControllers = @[vc1, vc2, vc3];
    [self setViewControllers:tabBarCtrl.viewControllers animated:true];
    //self.tabBar.hidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
