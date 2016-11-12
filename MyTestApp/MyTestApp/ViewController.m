//
//  ViewController.m
//  MyTestApp
//
//  Created by Gatsby on 8/28/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //UITextView *textview = [[UITextView alloc] initWithFrame: textContainer:<#(nullable NSTextContainer *)#>];
    
    CGRect rect = CGRectMake(50, 50, 200, 200);
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    
    label.text = @"hi";
    
    NSLog(@"%@", self.reciveText);
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) TranseValue:(NSString *)value
{
    self.reciveText = value;
    NSLog(@"%@", self.reciveText);
}

@end
