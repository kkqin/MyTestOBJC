//
//  SignUpTableViewController.m
//  MyTestApp
//
//  Created by Gatsby on 9/8/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "SignUpTableViewController.h"
#import "NameTableViewCell.h"
#import "ButtonTableViewCell.h"

@interface SignUpTableViewController ()
{
    NSString *textcellstyle;
    NSString *buttoncelstyle;
    NSInteger sections;
    NSArray *holderArray;
    NSArray *btArray;
}

@end

@implementation SignUpTableViewController

- (instancetype) init
{
    self = [super init];
    
    textcellstyle = @"cellofname_or_passwd";
    buttoncelstyle = @"button_cell";
    
    
    holderArray = [[NSArray alloc] initWithObjects: @"registername", @"mail", @"password", @"repassword", nil];
    //btArray = [[NSArray alloc] initWithObjects:@"CANCEL", @"SURE", nil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    sections = 2;
    
    self.tableView.allowsSelection = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"NameTableViewCell" bundle:nil] forCellReuseIdentifier:textcellstyle];
    [self.tableView registerNib:[UINib nibWithNibName:@"ButtonTableViewCell" bundle:nil] forCellReuseIdentifier:buttoncelstyle];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"default"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0)
    {
        return 4;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 0)
    {
        NameTableViewCell *cell = [NameTableViewCell  CellWithTableView:tableView];
        cell.textfiled.placeholder = holderArray[indexPath.row];
        return cell;
    }

    else if(indexPath.section == 1)
    {
        ButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:buttoncelstyle];
        if(indexPath.row == 0)
        {
            [cell.lbutton setTitle:btArray[indexPath.row] forState:UIControlStateNormal];
            cell.lbutton.backgroundColor = [UIColor purpleColor];
            [cell.lbutton setTitle:@"CANCEL" forState:UIControlStateNormal];
        }
        if(indexPath.row == 1)
        {
            cell.lbutton.backgroundColor = [UIColor redColor];
            [cell.lbutton setTitle:@"SURE" forState:UIControlStateNormal];
        }
        
        [cell.lbutton addTarget:self action:@selector(backLogin:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
    
    return [UITableViewCell alloc];
}

- (void) backLogin:(UIButton*)btn
{
    if([btn.titleLabel.text isEqualToString:@"CANCEL"])
    {
        [self dismissViewControllerAnimated:true completion:nil];
    }
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
