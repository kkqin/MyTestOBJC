//
//  SelfDetailTableViewController.m
//  MyTestApp
//
//  Created by Gatsby on 11/5/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "SelfDetailTableViewController.h"
#import "MsgUITableViewCell.h"
#import "DetailUITableViewController.h"

@interface SelfDetailTableViewController ()
{
    NSString *handler;
}
@end

@implementation SelfDetailTableViewController

- (instancetype) init:(NSString *)userHandlerLink
{
    self = [super init];
    
    handler = userHandlerLink;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    MessageBL * mbl = [[MessageBL alloc] retain] ;
    mbl.delegateForMessagesBL = self;
    [mbl putTheHandlerLinkToBL:handler];
    
    self.title = @"SELF";

    [self.tableView registerClass:[MsgUITableViewCell class] forCellReuseIdentifier:@"new"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"original"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
    
    DetailViewController *detailTableC = [[DetailViewController alloc] init:self.msgArray[indexPath.row]];
    detailTableC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:detailTableC animated:true];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
    {
        return 1;
    }
    else
    {
        return _msgArray.count;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return 200;
    }
    else
    {
        return [self.msgArray[indexPath.row] checkingHighOfMsgInLabel];
    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 20;
    }
    else
    {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        cell.backgroundColor = [UIColor lightGrayColor];
        return cell;
    }
    else
    {
        UITableViewCell *cell = [[MsgUITableViewCell alloc] init:0 item:self.msgArray[indexPath.row] reuseIdentifiler:@"new"];
        return cell;
    }
}

// 实现MessageItemDelegateBL 的方法
-(void) getUserMessages:(NSMutableArray<MessageItem *> *)m_array
{
    _msgArray = m_array;// 数据在这里
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
