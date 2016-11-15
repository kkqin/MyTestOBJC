//
//  DetailUITableViewController.m
//  MyTestApp
//
//  Created by Gatsby on 9/3/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "DetailUITableViewController.h"
#import "MsgUITableViewCell.h"
#import "SelfDetailTableViewController.h"
#import "KMMessagView.h"

@implementation DetailViewController
{
    MessageItem *m_item;
}

- (instancetype) init:(MessageItem *)item
{
    self = [super init];
    m_item = item;
    return self;
}

- (void) viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = false;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addBar];
    [self addTableView];
    [self addTextEnter];
    
    self.tabBarController.tabBar.hidden = true;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    if(indexPath.section == 0)
    {
        
    }
    else
    {
        
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
        return [m_item checkingHighOfMsgInLabel] + 100;
    else
        return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return 1;
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0)
    {
        UITableViewCell *cell = [[MsgUITableViewCell alloc] init:(NSInteger *)1 item:m_item reuseIdentifiler:@"ReuseIdentifierDetail"];
    
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

-(void) stuffData:(MessageItem *)item
{
    
}


-(void) addBar
{
    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];

    bar.backgroundColor = [UIColor blueColor];
    
    UINavigationItem *barTitle = [UINavigationItem alloc];
    [bar pushNavigationItem:barTitle animated:YES];
    UIBarButtonItem *baritem = [[UIBarButtonItem alloc] initWithTitle:@"BACK" style:UIBarButtonItemStylePlain target:self action:@selector(baritemBackbtn)];
    
    barTitle.leftBarButtonItem = baritem;
    
    [self.view addSubview:bar];
}

-(void) baritemBackbtn
{
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void) addTableView
{
    UITableView *tableviewctl = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [tableviewctl registerClass:[MsgUITableViewCell class] forCellReuseIdentifier:@"ReuseIdentifierDetail"];
    tableviewctl.delegate = self;
    tableviewctl.dataSource = self;
    tableviewctl.bounces = false;
    [self.view addSubview:tableviewctl];
}

-(void) addTextEnter
{
    CGSize size=[UIScreen mainScreen].bounds.size;
    CGRect boxFrame=CGRectMake(0,size.height, size.width, 45);
    KMMessagView *messagebox=[[KMMessagView alloc]initWithFrame:boxFrame PlaceText:@"评论" PlaceColor:[UIColor lightGrayColor]];
    [messagebox sendMessage:^(NSString *txt) {
        NSLog(@"%@",txt);
    }];
    [self.view addSubview:messagebox];
}

@end
