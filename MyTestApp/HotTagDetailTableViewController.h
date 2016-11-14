//
//  HotTagDetailTableViewController.h
//  MyTestApp
//
//  Created by Gatsby on 11/13/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageBL.h"

@interface HotTagDetailTableViewController : UITableViewController<MessageBLDelegate>

@property NSMutableArray<MessageItem *>* msgArray;

- (instancetype) init:(NSString *)hashTagLink;
@end


