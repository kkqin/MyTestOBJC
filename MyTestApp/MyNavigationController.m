//
//  MyNavigationController.m
//  MyTestApp
//
//  Created by Gatsby on 9/2/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "MyNavigationController.h"
#import <QuartzCore/QuartzCore.h>
#import "PersonInfoViewController.h"
#import "SelfDetailTableViewController.h"
#import "HotTagDetailTableViewController.h"

@implementation MyNavigationController
{
    UIButton *headImage;
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(turnToSelfDetailViewCtrl:) name:@"AskUserHandlerLink" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(turnToHashTagDetailViewCtrl:) name:@"AskHashTagLink" object:nil];
}

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
}

- (void) addHeadPic
{
    headImage = [[UIButton alloc] init];
    
    headImage.frame = CGRectMake(30, 20, 40, 40);
    headImage.backgroundColor = [UIColor orangeColor];
    headImage.layer.cornerRadius = headImage.frame.size.width / 2;
    headImage.clipsToBounds = YES;
    headImage.layer.borderWidth = 2.0;
    [headImage addTarget:self action:@selector(tapheadImage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:headImage];
}

- (void) tapheadImage
{
    [UIView animateKeyframesWithDuration:0.2 delay:0 options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
        headImage.backgroundColor = [UIColor grayColor];
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:0.2 delay:0 options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
            headImage.backgroundColor = [UIColor orangeColor];
        } completion:nil];
    }];
    
    [self addChildView];
}

- (void) addChildView
{
    PersonInfoViewController *viewctl = [[PersonInfoViewController alloc] init];
    [self addChildViewController:viewctl];
    [self.view addSubview:viewctl.view];
    [self didMoveToParentViewController:self];
}

-(void) turnToSelfDetailViewCtrl:(NSNotification*) notification
{
    NSString *str = [notification object];//通过这个获取到传递的对象
    SelfDetailTableViewController *sDetail = [[SelfDetailTableViewController alloc] init:str];
    [self pushViewController:sDetail animated:true];
    self.tabBarController.tabBar.hidden = true;
}

-(void) turnToHashTagDetailViewCtrl:(NSNotification*) notification
{
    NSString *str = [notification object];
    HotTagDetailTableViewController *hDetail = [[HotTagDetailTableViewController alloc] init:str];
    [self pushViewController:hDetail animated:true];
}

@end
