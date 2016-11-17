//
//  MessageBL.m
//  MyTestApp
//
//  Created by Gatsby on 9/4/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageBL.h"

@implementation MessageBL
{
    
}

- (instancetype) init
{
    self = [super init];
    return self;
}

- (void) getAllMessagesBL
{
    _network = [[NetWork alloc] retain];
    _network.delegateForMessagesNet = self;
    [self.network getAllMessages];
}

- (void) getMessageFinishNetWork:(NSMutableArray<MessageItem *> *)m_array :(NSString*)str
{
    NSLog(@"BL %@", m_array);
    [self.delegateForMessagesBL getAllMessages:m_array :str];
}

- (void) putOneselfMessageToBL:(MessageItem *)one_m_item
{
    _network = [[NetWork alloc] retain];
    _network.delegateForMessagesNet = self;
    [self.network putOneselfMessageToNetWork:one_m_item];
}

- (void) putTheHandlerLinkToBL:(NSString *)userHandlerLink
{
    _network = [[NetWork alloc] retain];
    _network.delegateForMessagesNet = self;
    [self.network getUserHandlerLink:userHandlerLink];
}

- (void) getUserMessageFinishNetWork:(NSMutableArray<MessageItem *> *)m_array
{
    [self.delegateForMessagesBL getUserMessages:m_array];
}

- (void) putTheHashTagLinkToBL:(NSString *)hashTag
{
    _network = [[NetWork alloc] retain];
    _network.delegateForMessagesNet = self;
    [self.network getSameAboutHashTag:hashTag];
}

- (void) getHashTagMessageFinishNetWork:(NSMutableArray<MessageItem *> *)m_array
{
    [self.delegateForMessagesBL getHashTagMessages:m_array];
}

- (void) putTheRelationMsgId:(NSString *)relatId
{
    _network = [[NetWork alloc] retain];
    _network.delegateForMessagesNet = self;
    [self.network getTheRelationMsg:relatId];
}

- (void) getTheRelationMsgFinishNetWork:(NSMutableArray<MessageItem *> *)m_array
{
    [self.delegateForMessagesBL getTheRelationMessages:m_array];
}

@end
