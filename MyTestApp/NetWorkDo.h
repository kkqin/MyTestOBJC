//
//  NetWorkDo.h
//  MyTestApp
//
//  Created by Gatsby on 9/4/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "JSONKit.h"
#import "MessageItem.h"
#import "UserItem.h"

@protocol NetWorkDelegateForMessagesInfo <NSObject>

@optional
-(void) getMessageFinishNetWork:(NSMutableArray<MessageItem *> *)m_array :(NSString *)str;
-(void) getUserMessageFinishNetWork:(NSMutableArray<MessageItem *> *)m_array;
-(void) getHashTagMessageFinishNetWork:(NSMutableArray<MessageItem *> *)m_array;
-(void) getTheRelationMsgFinishNetWork:(NSMutableArray<MessageItem *> *)m_array;
@end

@interface NetWork : NSObject

@property (nonatomic, assign) id<NetWorkDelegateForMessagesInfo> delegateForMessagesNet;
@property (nonatomic, retain) NSMutableArray *r_array;

+ (instancetype) sharedInstance;

- (void) getAllMessages;
- (void) getCurrentUserListMessages;
- (void) getUserHandlerLink:(NSString*)userHandlerLink;
- (void) putOneselfMessageToNetWork:(MessageItem *)m_item;
//- (void) putOneselfMessageImageToNetWork:( *)image;
- (void) registerUserRequestToNetWork:(UserItem *)user_item;
- (void) getSameAboutHashTag:(NSString *)hashTagLink;
- (void) getTheRelationMsg:(NSString*)relatId;

@end
