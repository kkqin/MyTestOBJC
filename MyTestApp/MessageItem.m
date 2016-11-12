//
//  MessageItem.m
//  MyTestApp
//
//  Created by Gatsby on 9/4/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageItem.h"

@implementation MessageItem

//MARK: init
-(instancetype) init:(NSMutableDictionary *)mdic
{
    self = [super init];
    
    _u_id = mdic[@"u_id"];
    _u_name = mdic[@"u_name"];
    _m_type = mdic[@"m_type"];
    _m_pic = mdic[@"m_pic"];
    
    NSDate *datetime = [[NSDate alloc] init];
    NSDateFormatter *dformatter = [[NSDateFormatter alloc] init];
    dformatter.dateFormat = @"yyy-MM-dd HH:mm:ss";
    
    NSString *tt=[dformatter stringFromDate:datetime];
    
    NSString *time = [self intervalFromLastDate:mdic[@"m_time"] toTheDate:tt];
    NSString *back = @"min";
    time = [[NSString alloc] initWithFormat:@"%@%@", time, back];
    
    _m_msg = mdic[@"m_msg"];
    _m_time = time;
    
    return self;
}

//MARK: check high of the message label
-(NSInteger) checkingHighOfMsgInLabel
{
    UILabel *lmessage = [[UILabel alloc] init];
    lmessage.numberOfLines = 0;
    lmessage.lineBreakMode = NSLineBreakByTruncatingTail;
    CGRect textRect = [_m_msg boundingRectWithSize:CGSizeMake(265, 200) options:NSStringDrawingUsesLineFragmentOrigin attributes: @{NSFontAttributeName:lmessage.font} context:nil];
    
    if(![_m_pic  isEqual: [NSNull null]])
    {
        // 图片高度定为100, 然后多30
        return 50 + textRect.size.height + 100 + 30;
    }
    else
    {
        // 直接多30
        return 50 + textRect.size.height + 30;
    }
}

//MARK: count time for time label
- (NSString *)intervalFromLastDate: (NSString *) dateString1  toTheDate:(NSString *) dateString2
{
    NSArray *timeArray1=[dateString1 componentsSeparatedByString:@"."];
    dateString1=[timeArray1 objectAtIndex:0];
    
    NSArray *timeArray2=[dateString2 componentsSeparatedByString:@"."];
    dateString2=[timeArray2 objectAtIndex:0];
    
    NSLog(@"%@.....%@",dateString1,dateString2);
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *d1=[date dateFromString:dateString1];
    
    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
    
    NSDate *d2=[date dateFromString:dateString2];
    
    NSTimeInterval late2=[d2 timeIntervalSince1970]*1;
    
    NSTimeInterval cha=late2-late1;
    NSString *timeString=@"";
    NSString *house=@"";
    NSString *min=@"";
    NSString *sen=@"";
    
    sen = [NSString stringWithFormat:@"%d", (int)cha%60];
    //        min = [min substringToIndex:min.length-7];
    //    秒
    sen=[NSString stringWithFormat:@"%@", sen];
    
    min = [NSString stringWithFormat:@"%d", (int)cha/60%60];
    //        min = [min substringToIndex:min.length-7];
    //    分
    min=[NSString stringWithFormat:@"%@", min];
    
    //    小时
    house = [NSString stringWithFormat:@"%d", (int)cha/3600];
    //        house = [house substringToIndex:house.length-7];
    house=[NSString stringWithFormat:@"%@", house];
    
    timeString = [NSString stringWithFormat:@"%@:%@:%@",house,min,sen];
    [date release];
    
    return min;
}

@end
