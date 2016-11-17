//
//  DetailUITableViewController.h
//  MyTestApp
//
//  Created by Gatsby on 9/3/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainUITableViewController.h"

@interface DetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, MessageBLDelegate>

@property NSString *msgdetail;
@property (nonatomic, strong) UILabel *label;

- (instancetype) init:(MessageItem *)item;

@end
