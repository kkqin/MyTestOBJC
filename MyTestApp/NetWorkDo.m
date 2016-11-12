//
//  NetWorkDo.m
//  MyTestApp
//
//  Created by Gatsby on 9/4/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "NetWorkDo.h"
#import "MessageItem.h"

@implementation NetWork
{
    
}

- (instancetype) init
{
    self = [super init];
    return self;
}

+ (instancetype) sharedInstance
{
    static NetWork *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [NetWork new];
    });
    return instance;
}

- (void) getAllMessages
{
    NSURL *URL = [NSURL URLWithString:@"http://127.0.0.1/ios/apptest/getMessages.php"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] init];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSMutableArray *jsondata = [responseObject mutableCopy];
        
        self.r_array = [[NSMutableArray alloc] init];
        for(int i = 0; i < jsondata.count; i++)
        {
            MessageItem *m_item = [[[MessageItem alloc] init:jsondata[i]] retain];
            [self.r_array addObject:m_item];
            [m_item release];
        }
        NSLog(@"r_array %@", _r_array);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegateForMessagesNet getMessageFinishNetWork:_r_array :@"yes"];
        });

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void) getSameAboutHashTag:(NSString*)hashTag
{

}

- (void) getUserHandlerLink:(NSString*)userHandlerLink
{
    NSURL *URL = [NSURL URLWithString:@"http://127.0.0.1/ios/apptest/getHandlerUser.php"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] init];

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSMutableDictionary *parametersDictionary = [NSMutableDictionary dictionary];
    [parametersDictionary setObject:userHandlerLink forKey:@"u_handlerLink"];
    
    [manager GET:URL.absoluteString parameters:parametersDictionary progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"success! |||||||-- %@ --|||||||", responseObject);
       
        NSMutableArray *jsondata = [responseObject mutableCopy];
        
        self.r_array = [[NSMutableArray alloc] init];
        for(int i = 0; i < jsondata.count; i++)
        {
            MessageItem *m_item = [[[MessageItem alloc] init:jsondata[i]] retain];
            [self.r_array addObject:m_item];
            [m_item release];
        }
        NSLog(@"r_array %@", _r_array);
        
        // 异步
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegateForMessagesNet getUserMessageFinishNetWork:_r_array];
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: EEEEEE-- %@ --EEEEEE", error);
    }];
}

- (void) getCurrentUserListMessages
{
    NSURL *URL = [NSURL URLWithString:@"http://127.0.0.1/ios/apptest/getCurrentListMessages.php"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] retain];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    URL;
}

-(void) putOneselfMessageToNetWork:(MessageItem *)m_item
{
    NSURL *URL = [NSURL URLWithString:@"http://127.0.0.1/ios/apptest/putOneselfMessage.php"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] init];
    
    NSMutableDictionary *parametersDictionary = [NSMutableDictionary dictionary];
    
    [parametersDictionary setObject:m_item.u_id forKey:@"u_id"];
    [parametersDictionary setObject:m_item.m_id forKey:@"m_id"];
    [parametersDictionary setObject:m_item.m_msg forKey:@"m_msg"];
    [parametersDictionary setObject:[NSNumber numberWithInt:m_item.m_type] forKey:@"m_type"];
    [parametersDictionary setObject:m_item.m_time forKey:@"m_time"];
    //[parametersDictionary setObject:m_item.m_pic forKey:@"m_pic"];

    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:URL.absoluteString parameters:parametersDictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success! |||||||-- %@ --|||||||", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: EEEEEE-- %@ --EEEEEE", error);
    }];
}

-(void) registerUserRequestToNetWork:(UserItem *)user_item
{
    NSURL *URL = [NSURL URLWithString:@"http://127.0.0.1/ios/apptest/registerUser.php"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] init];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSDictionary *parametersDictionary= @{
                     @"u_id":user_item.u_id,
                     @"u_name":user_item.u_name,
                     @"u_passwd":user_item.u_passwd,
                     @"u_register_date":user_item.u_register_date,
                     @"u_last_active_date":user_item.u_last_active_date,
                    };
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parametersDictionary options:NSJSONWritingPrettyPrinted error:nil];
    
    [manager POST:URL.absoluteString parameters:jsonData progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"succees %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
