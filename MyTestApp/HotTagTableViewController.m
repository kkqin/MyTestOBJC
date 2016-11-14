//
//  HotTagTableViewController.m
//  MyTestApp
//
//  Created by Gatsby on 11/12/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "HotTagTableViewController.h"
#import "MessageBL.h"
#import "MsgUITableViewCell.h"

@interface HotTagTableViewController ()<UISearchBarDelegate, MessageBLDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray<MessageItem *>* msgArray;
    UITableView *aTableView;
    UISearchBar *aSearchBar;
}
@end

@implementation HotTagTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];

    self.title = @"HOT";
    [self addSearchBar];
    [self addTableView];
}

- (void)viewTapped:(UITapGestureRecognizer*)tapGr
{
    [aSearchBar resignFirstResponder];
}

- (void) addSearchBar
{
    aSearchBar = [[UISearchBar alloc] init];
    aSearchBar.frame = CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, 20);
    [aSearchBar sizeToFit];
    aSearchBar.delegate = self;
    [self.view addSubview:aSearchBar];
}

- (void) addTableView
{
    aTableView = [[UITableView alloc] init];
    aTableView.frame = CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    aTableView.delegate = self;
    aTableView.dataSource = self;
    [self.view addSubview:aTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [msgArray[indexPath.row] checkingHighOfMsgInLabel];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return msgArray.count;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    MessageBL *bl = [[MessageBL alloc] init];
    bl.delegateForMessagesBL = self;
    [bl putTheHashTagLinkToBL:searchBar.text];
}

- (void)getHashTagMessages:(NSMutableArray<MessageItem *> *)m_array
{
    msgArray = m_array;
    [aTableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(msgArray.count == 0)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        return cell;
    }
    else
    {
        UITableViewCell *cell = [[MsgUITableViewCell alloc] init:0 item:msgArray[indexPath.row] reuseIdentifiler:@"new"];
        return cell;
    }
}

-(NSIndexPath *)tableView:(UITableView *)tableView
 willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [aSearchBar resignFirstResponder];
    return indexPath;
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
