//
//  UserItem.m
//  MyTestApp
//
//  Created by Gatsby on 9/7/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "UserItem.h"

@implementation UserItem

- (instancetype) init:(NSMutableDictionary *)m_dic
{
    self = [super init];
    
    _u_id = m_dic[@"u_id"];
    _u_name = m_dic[@"u_name"];
    _u_passwd = m_dic[@"u_passwd"];
    
    return  self;
}

@end
