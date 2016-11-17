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
    NSMutableArray<MessageItem *>* msgArray;
    UITableView *tableviewctl;
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
    [self tableViewDoADelegate];
    
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
        return [self->msgArray[indexPath.row] checkingHighOfMsgInLabel];
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 10;
    }
    else
    {
        return 0;
    }
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
        return self->msgArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0)
    {
        UITableViewCell *cell = [[MsgUITableViewCell alloc] init:(NSInteger *)1 item:m_item reuseIdentifiler:@"ReuseIdentifierDetail"];
    
        return cell;
    }
    else
    {
        UITableViewCell *cell = [[MsgUITableViewCell alloc] init:0 item:self->msgArray[indexPath.row] reuseIdentifiler:@"new"];
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
    tableviewctl = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [tableviewctl registerClass:[MsgUITableViewCell class] forCellReuseIdentifier:@"ReuseIdentifierDetail"];
    tableviewctl.delegate = self;
    tableviewctl.dataSource = self;
    //tableviewctl.bounces = false;
    [self.view addSubview:tableviewctl];
}

-(void) addTextEnter
{
    CGSize size=[UIScreen mainScreen].bounds.size;
    CGRect boxFrame=CGRectMake(0,size.height, size.width, 45);
    KMMessagView *messagebox=[[KMMessagView alloc]initWithFrame:boxFrame PlaceText:@"commit" PlaceColor:[UIColor lightGrayColor]];
    [messagebox sendMessage:^(NSString *txt) {
        NSDate *datetime = [[NSDate alloc] init];
        NSDateFormatter *dformatter = [[NSDateFormatter alloc] init];
        dformatter.dateFormat = @"yyy-MM-dd HH:mm:ss";
        
        MessageItem *m_item_ = [[MessageItem alloc] init];
        m_item_.u_id = @"10001";
        m_item_.m_msg = txt;
        m_item_.m_id = @"";
        m_item_.m_time = [dformatter stringFromDate:datetime];
        m_item_.m_type = 2;
        m_item_.m_relation = m_item.m_id;
        //m_item.m_pic = [self imageBase64WithDataURL:imageMessage.image];
        
        MessageBL * mbl = [[MessageBL alloc] retain] ;
        mbl.delegateForMessagesBL = self;
        [mbl putOneselfMessageToBL:m_item_];
    }];
    [self.view addSubview:messagebox];
}

-(void) tableViewDoADelegate
{
    MessageBL *bl = [[MessageBL alloc] init];
    bl.delegateForMessagesBL = self;
    [bl putTheRelationMsgId:m_item.m_id];
}

-(void) getTheRelationMessages:(NSMutableArray<MessageItem *> *)m_array
{
    msgArray = m_array;
    [self->tableviewctl reloadData];
}

@end
