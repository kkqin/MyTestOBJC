//
//  MessageBL.h
//  MyTestApp
//
//  Created by Gatsby on 9/4/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#ifndef MessageBL_h
#define MessageBL_h
#import "NetWorkDo.h"

@protocol MessageBLDelegate <NSObject>

@optional
- (void) getAllMessages:(NSMutableArray<MessageItem *> *)m_array :(NSString*)str;
- (void) getUserMessages:(NSMutableArray<MessageItem *> *)m_array;
@end

@interface MessageBL : NSObject<NetWorkDelegateForMessagesInfo>

@property (nonatomic, assign) id<MessageBLDelegate> delegateForMessagesBL;
@property (nonatomic, strong) NetWork *network;
@property (nonatomic, strong) NSMutableArray *m_array;

- (void) getAllMessagesBL;
- (void) putOneselfMessageToBL:(MessageItem *)one_m_item;
- (void) putTheHandlerLinkToBL:(NSString *)userHandlerLink;
@end

#endif /* MessageBL_h */
