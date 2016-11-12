//
//  MessageItem.h
//  MyTestApp
//
//  Created by Gatsby on 9/4/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#ifndef MessageItem_h
#define MessageItem_h
#import <UIKit/UIKit.h>

@interface MessageItem : NSObject

@property (nonatomic, strong) NSString *m_id;
@property (nonatomic, strong) NSString *u_id;
@property (nonatomic, strong) NSString *m_msg;
@property (nonatomic, strong) NSString *m_pic;
@property (nonatomic, strong) NSString *m_time;
@property (nonatomic, strong) NSString *m_relation;
@property int m_type;
@property (nonatomic, strong) NSString *u_name;

-(instancetype) init:(NSMutableDictionary *)mdic;
-(NSInteger) checkingHighOfMsgInLabel;
@end

#endif /* MessageItem_h */
