//
//  MainUITableViewController.h
//  MyTestApp
//
//  Created by Gatsby on 9/1/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageBL.h"
#import "MessageItem.h"

@protocol MainTablViewDataSource <NSObject>
@optional
-(void)TranseValue:(NSMutableArray<MessageItem *>*)array;//要交给代理的值是NSString型的
@end

@interface MainUITableViewController : UITableViewController<MessageBLDelegate>

@property (nonatomic, assign) id<MainTablViewDataSource> maindatadelegate;// 虽然有自己的代理，但未使用(若使用了就删除注释)

@property NSString *mainlabel;
@property NSMutableArray<MessageItem *>* msgArray;//contain MessageItem

@end
