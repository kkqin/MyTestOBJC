//
//  LoginTableViewController.m
//  MyTestApp
//
//  Created by Gatsby on 9/7/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "LoginTableViewController.h"
#import "NameTableViewCell.h"
#import "ButtonTableViewCell.h"
#import "MainUITableViewController.h"
#import "MyNavigationController.h"
#import "SignUpTableViewController.h"
#import "TabBarViewController.h"

@interface LoginTableViewController ()
{
    NSString *textcellstyle;
    NSString *buttoncelstyle;
    UITableView *tableviewctl;
}

@end

@implementation LoginTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    textcellstyle = @"cellofname_or_passwd";
    buttoncelstyle = @"button_cell";

    [self addBar];
    [self addTableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 1 || section == 2) return 2;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ok"];
        cell.textLabel.text = @"!WELCOME!";
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
    }
    
    if(indexPath.section == 1)
    {
        NameTableViewCell *cell = [[NameTableViewCell CellWithTableView:tableviewctl] retain];
        cell.textfiled.placeholder = @"username";
        cell.textfiled.clearButtonMode = UITextLayoutDirectionDown;
        if(indexPath.row == 1)
        {
            cell.textfiled.placeholder = @"password";
            cell.textfiled.secureTextEntry = true;
            
        }
        return cell;
    }
    
    if(indexPath.section == 2)
    {
         ButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:buttoncelstyle];
        if(indexPath.row == 0)
        {
            cell.lbutton.backgroundColor = [UIColor purpleColor];
            [cell.lbutton setTitle:@"SIGN UP" forState:UIControlStateNormal];
        }
        if(indexPath.row == 1)
        {
            cell.lbutton.backgroundColor = [UIColor orangeColor];
            [cell.lbutton setTitle:@"SIGN IN" forState:UIControlStateNormal];
        }
        
        //[cell.lbutton addTarget:self action:@selector(toParticularView) forControlEvents:UIControlEventTouchUpInside];
        [cell.lbutton addTarget:self action:@selector(toParticularView:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    
    return [UITableViewCell alloc];
}

-(void) toSignUpView
{
    [self presentViewController:[[SignUpTableViewController alloc] init] animated:true completion:nil];
    NSLog(@"toSign");
}

-(void) toParticularView:(UIButton *)btn
{
    if([btn.titleLabel.text  isEqual: @"SIGN IN"])
    {
        MyNavigationController *mainTableC;
        //mainTableC = [[MyNavigationController alloc] initWithRootViewController:[[MainUITableViewController alloc] init]];
        //mainTableC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        //[self presentViewController:mainTableC animated:true completion:nil];
        
        TabBarViewController *tbC = [[TabBarViewController alloc] init];
        [self presentViewController:tbC animated:true completion:nil];
    }
    else
    {
        SignUpTableViewController *signUpC;
        signUpC = [[SignUpTableViewController alloc] init];
        [self presentViewController:signUpC animated:true completion:nil];
    }
}

-(void) addBar
{
    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    
    bar.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:bar];
}

-(void) addTableView
{
    tableviewctl = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [tableviewctl registerNib:[UINib nibWithNibName:@"NameTableViewCell" bundle:nil] forCellReuseIdentifier:textcellstyle];
    [tableviewctl registerNib:[UINib nibWithNibName:@"ButtonTableViewCell" bundle:nil] forCellReuseIdentifier:buttoncelstyle];
    
    tableviewctl.delegate = self;
    tableviewctl.dataSource = self;
    tableviewctl.allowsSelection = NO;
    [self.view addSubview:tableviewctl];
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
