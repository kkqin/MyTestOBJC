//
//  PersonInfoViewController.m
//  MyTestApp
//
//  Created by Gatsby on 9/6/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "PersonInfoViewController.h"

@implementation PersonInfoViewController
{
    NSMutableArray *colorArray;
    NSMutableArray *textArray;
    UITableView *insideTableView;
    UIView *blankView;
}

- (instancetype) init
{
    self = [super init];
    
    colorArray = [[NSMutableArray alloc] initWithObjects:[UIColor whiteColor], [UIColor blueColor],
                                                         [UIColor blackColor], [UIColor brownColor],
                                                          [UIColor yellowColor] ,[UIColor redColor],
                                                        [UIColor grayColor], [UIColor greenColor],
                                                        [UIColor purpleColor], [UIColor orangeColor],
                                                          [UIColor darkGrayColor], [UIColor darkTextColor],nil];
    
    textArray = [[NSMutableArray alloc] initWithObjects:@"PERSONAL INFO", @"HOT LABLE", @"SEARCH", @"SETTING", nil];
    
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self addSomeView];
}

- (void) addSomeView
{
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    UITapGestureRecognizer *tapInside = [[UITapGestureRecognizer alloc] init];
    [tapInside addTarget:self action:@selector(dismissThisView:)];
    
    insideTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -self.navigationController.navigationBar.frame.size.height, [UIScreen mainScreen].bounds.size.width - 100, [UIScreen mainScreen].bounds.size.height+64) style:UITableViewStylePlain];
    insideTableView.delegate = self;
    insideTableView.dataSource = self;
    insideTableView.separatorStyle = NO;
    //insideTableView.bounces = NO;
    [insideTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"personInfoTCell"];
    
    blankView = [[UIView alloc] initWithFrame:CGRectMake(insideTableView.frame.size.width, insideTableView.frame.origin.y, 100, insideTableView.frame.size.height)];
    blankView.backgroundColor = [UIColor clearColor];
    
    CATransition *animate = [self createCATrans:2 fillmode:kCATransitionFromLeft type:kCATransitionPush subtype:kCATransitionFromLeft];
    CATransition *animate_2 = [self createCATrans:2 fillmode:nil type:nil subtype:kCATransitionFromRight];
    [insideTableView.layer addAnimation:animate forKey:@"insideTableViewAnimate"];
    [self.view.layer addAnimation:animate_2 forKey:@"selfViewAnimate"];
    
    [blankView addGestureRecognizer:tapInside];
    
    [self.view addSubview:insideTableView];
    [self.view addSubview:blankView];
    
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    if( indexPath.section == 0)
    {
        NSLog(@"index path section selected.");
    }
    else
    {
        if(indexPath.row == 0)
        {
            NSLog(@"index path row 0 selected.");
        }
        if(indexPath.row == 1)
        {
            NSLog(@"index path row 1 selected.");
        }
        if(indexPath.row == 2)
        {
            NSLog(@"index path row 2 selected.");
        }
        if(indexPath.row == 3)
        {
            NSLog(@"index path row 3 selected.");
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
        return 200;
    else
        return 50;
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
        return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if(indexPath.section == 0)
    {
        cell.backgroundColor = [UIColor grayColor];
        cell.textLabel.text = @"ME";
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    if(indexPath.section == 1)
    {
        cell.backgroundColor = [self colorRand:colorArray];
        if([cell.backgroundColor isEqual:[UIColor whiteColor]] || [cell.backgroundColor isEqual:[UIColor yellowColor]]|| [cell.backgroundColor isEqual:[UIColor greenColor]])
        {
            cell.textLabel.textColor = [UIColor blackColor];
        }
        else
        {
            cell.textLabel.textColor = [UIColor whiteColor];
        }
            
        cell.textLabel.text = textArray[indexPath.row];
    }
    
    return cell;
}

- (CATransition *)createCATrans:(CGFloat)duration
                       fillmode:(nullable NSString *)fillmode
                           type:(nullable NSString *)type
                        subtype:(nullable NSString *)subtype
{
    CATransition *animate = [[CATransition alloc] init];
    

        animate.duration = duration;
    if (fillmode != nil)
        animate.fillMode = fillmode;
    else if (type != nil)
        animate.type = type;
    else if (subtype != nil)
        animate.subtype = subtype;
    
    return animate;
}

- (void) dismissThisView:(UITapGestureRecognizer*) sender
{
    CGPoint p = [sender locationInView:self.view];
    if (p.x > [UIScreen mainScreen].bounds.size.width - 100)
    {
        CATransition *animate = [self createCATrans:1 fillmode:nil type:nil subtype:nil];
        self.view.backgroundColor = [UIColor clearColor];
        [self.view.layer addAnimation:animate forKey:@"leftView"];
        
        [UIView animateWithDuration:1 animations:^{
            CGRect temp = self.view.frame;
            temp.origin.x = -414;
        } completion:^(BOOL finished){
            
            [self willMoveToParentViewController:nil];
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
            
        }];
    }
}

-(UIColor*) colorRand:(NSMutableArray *)ca;
{
    return ca[arc4random() % colorArray.count] ;
}

@end
