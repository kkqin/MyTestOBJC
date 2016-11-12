//
//  SelfDetailTableViewController.h
//  MyTestApp
//
//  Created by Gatsby on 11/5/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageBL.h"
#import "MessageItem.h"

@interface SelfDetailTableViewController : UITableViewController<MessageBLDelegate>

@property NSMutableArray<MessageItem *>* msgArray;

- (instancetype) init:(NSString *)userHandlerLink;
@end
