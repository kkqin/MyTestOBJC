//
//  MainUITableViewController.m
//  MyTestApp
//
//  Created by Gatsby on 9/1/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "MainUITableViewController.h"
#import "ViewController.h"
#import "DetailUITableViewController.h"
#import "MsgUITableViewCell.h"
#import "MyNavigationController.h"
#import "SendViewController.h"
#import "SelfDetailTableViewController.h"

#import <QuartzCore/QuartzCore.h>


@interface MainUITableViewController()
{
    UIRefreshControl *freshCtl;
}

@end

@implementation MainUITableViewController
{
    UIButton *headImage;
}

@synthesize mainlabel, msgArray;
- (instancetype) init
{
    self = [super init];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[MsgUITableViewCell class] forCellReuseIdentifier:@"new"];
    
    self.msgArray = [[NSMutableArray alloc] init];
    self.title = @"HOME";
    MessageBL * mbl = [[MessageBL alloc] retain];
    mbl.delegateForMessagesBL = self;
    [mbl getAllMessagesBL];

    UIBarButtonItem *sendbtn = [[UIBarButtonItem alloc] initWithTitle:@"SAY" style:UIBarButtonItemStylePlain target:self action:@selector(turnToSendView)];
    self.navigationItem.rightBarButtonItem = sendbtn;
    
    [self.navigationController popToRootViewControllerAnimated:true];
    [self addRefresh];
}

//选中效果
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
    
    DetailViewController *detailTableC = [[DetailViewController alloc] init:self.msgArray[indexPath.row]];
    detailTableC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:detailTableC animated:true];
}

//高度
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.msgArray.count <= 0)
        return 0;
    else
        return [self.msgArray[indexPath.row] checkingHighOfMsgInLabel];
}

//分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//每个分区有几行
- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return self.msgArray.count;
}

//内容
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[MsgUITableViewCell alloc] init:0 item:self.msgArray[indexPath.row] reuseIdentifiler:@"new"];
    return cell;
}

-(void) getAllMessages:(NSMutableArray<MessageItem *> *)m_array :(NSString*)str
{
    self.msgArray = m_array;
    [self.tableView reloadData];
}

-(void) turnToSendView
{
    SendViewController *sendController = [[SendViewController alloc] init];
    [self presentViewController:sendController animated:true completion:nil];
}

-(void) addRefresh
{
    self.automaticallyAdjustsScrollViewInsets = true;
    freshCtl = [[UIRefreshControl alloc] init];
    freshCtl.backgroundColor = [UIColor clearColor];
    [freshCtl addTarget:self action:@selector(refreshing) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:freshCtl];
}

-(void) refreshing
{
    NSLog(@"reloading...");
    MessageBL * mbl = [[MessageBL alloc] retain];
    mbl.delegateForMessagesBL = self;
    [mbl getAllMessagesBL];
    [self.tableView reloadData];
    [freshCtl endRefreshing];
}

@end
