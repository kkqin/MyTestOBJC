//
//  UserItem.h
//  MyTestApp
//
//  Created by Gatsby on 9/7/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#ifndef USERITEM_H_
#define USERITEM_H_
#import <UIKit/UIKit.h>

@interface UserItem : NSObject

@property (nonatomic, strong) NSString *u_name;
@property (nonatomic, strong) NSString *u_id;
@property (nonatomic, strong) NSString *u_passwd;
@property (nonatomic, strong) NSString *u_register_date;
@property (nonatomic, strong) NSString *u_last_active_date;

- (instancetype) init:(NSMutableDictionary *)m_dic;

@end

#endif