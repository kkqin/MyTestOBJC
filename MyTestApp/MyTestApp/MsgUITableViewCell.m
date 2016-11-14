//
//  MsgUITableViewCell.m
//  MyTestApp
//
//  Created by Gatsby on 9/2/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "MsgUITableViewCell.h"
#import "MyNavigationController.h"

@implementation MsgUITableViewCell
{

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (instancetype)init:(NSInteger *)type item:(MessageItem *)item reuseIdentifiler:(nullable NSString *)reuseIndentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIndentifier];
    //self.backgroundColor = [UIColor yellowColor];
    
    [self stuffData:item];
    [self rebuidInteface:type];
    
    return self;
}

- (bool) rebuidInteface:(NSInteger *)type
{
    CGFloat baseHorizontal_X = 25;
    CGFloat baseVertical_Y = 20;
    CGFloat standard_HIGH = 0;
    CGFloat standard_WIDTH = 0;
    CGFloat standard_HIGH_OF_LABEL_HEAD_PIC = 50;
    CGFloat standard_HIGH_OF_BUTTON_NAME = 20;
    CGFloat standard_HIGH_OF_LABEL_TIME = 20;
    CGFloat standard_HIGH_OF_MESSAGE_PIC = 0;
    CGFloat standard_WIDTH_OF_LABEL_HEAD_PIC = 50;
    CGFloat standard_WIDTH_OF_BUTTON_NAME = 100;
    CGFloat standard_WIDTH_OF_LABEL_TIME = 60;
    CGFloat standard_WIDTH_OF_MESSAGE_PIC = 0;
    
    CGFloat limitMessageLabelHigh = 200;
    CGFloat limitMessageLabelWidth = 265;
    CGFloat messageLabelHorizontal_X = 100;
    CGFloat messageLabelVertical_Y = 50;
    
    CGFloat messagePicWidth = limitMessageLabelWidth;
    CGFloat messagePicHigh = 100;
    CGFloat messagePicHorizontal_X = messageLabelHorizontal_X;
    CGFloat messagePicVeritcal_Y = messageLabelVertical_Y + 10;
    
    CGFloat fontSize = 25;
    
    _head_image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"without_pic"]];
    _head_image.frame = CGRectMake(baseHorizontal_X, baseVertical_Y, standard_WIDTH_OF_LABEL_HEAD_PIC, standard_HIGH_OF_LABEL_HEAD_PIC);
    _head_image.backgroundColor = [UIColor orangeColor];
    
    _name_button = [[UIButton alloc] init];
    [_name_button setTitle:_u_name
                  forState: UIControlStateNormal];
    _name_button.frame = CGRectMake(100, baseVertical_Y, standard_WIDTH_OF_BUTTON_NAME, standard_HIGH_OF_BUTTON_NAME);
    _name_button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_name_button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _name_button.titleLabel.font = [UIFont fontWithName:@"" size:fontSize];
    //_name_button.backgroundColor = [UIColor redColor];
    
    _llabel = [[UILabel alloc] initWithFrame:CGRectMake(360, baseVertical_Y, standard_WIDTH_OF_LABEL_TIME, standard_HIGH_OF_LABEL_TIME)];
    _llabel.text = _u_time;
    _llabel.textColor = [UIColor grayColor];
    //_llabel.backgroundColor = [UIColor blueColor];
    
    _lmessage = [[KILabel alloc] init];
    _lmessage.text = _u_msg;
    _lmessage.numberOfLines = 0;
    _lmessage.lineBreakMode = NSLineBreakByTruncatingTail;
    _lmessage.userHandleLinkTapHandler = ^(KILabel *label, NSString *string, NSRange range){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AskUserHandlerLink" object:string];
    };
    
    _lmessage.urlLinkTapHandler = ^(KILabel *label, NSString *string, NSRange range) {
        NSLog(@"url link %@", string);
        NSURL *url = [[NSURL alloc] initWithString:string];
        [[UIApplication sharedApplication] openURL:url];
    };
    
    _lmessage.hashtagLinkTapHandler = ^(KILabel *label, NSString *string, NSRange range) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AskHashTagLink" object:string];
    };
    
    if(type == (NSInteger *)1)
    {
        limitMessageLabelWidth = [UIScreen mainScreen].bounds.size.width-30;
        limitMessageLabelHigh = 406;
        messageLabelHorizontal_X = 20;
        messageLabelVertical_Y = 100;
        messagePicHorizontal_X = messageLabelHorizontal_X;
        messagePicVeritcal_Y = messageLabelVertical_Y + 10;
        messagePicWidth = limitMessageLabelWidth;
        messagePicHigh = 150;
    }
    
    CGRect textRect = [_u_msg boundingRectWithSize:CGSizeMake(limitMessageLabelWidth, limitMessageLabelHigh) options:NSStringDrawingUsesLineFragmentOrigin attributes: @{NSFontAttributeName:_lmessage.font} context:nil];
    _lmessage.frame = CGRectMake(messageLabelHorizontal_X, messageLabelVertical_Y, textRect.size.width, textRect.size.height);
    
    _lmessage.backgroundColor = [UIColor clearColor];
    
    // 判断NSString 为空
    if(![_u_pic  isEqual: [NSNull null]])
    {
        // thread
        NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
        
        _msg_uiView  = [[[UIImageView alloc] initWithFrame:CGRectMake(messagePicHorizontal_X, messagePicVeritcal_Y + textRect.size.height, messagePicWidth, messagePicHigh)] init];
        [_msg_uiView setBackgroundColor:[UIColor grayColor]];
        [self addSubview:_msg_uiView];

        NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImage:) object:(id)_u_pic];
        [operationQueue addOperation:op];
    }
    
    [self addSubview:_head_image];
    [self addSubview:_name_button];
    [self addSubview:_llabel];
    [self addSubview:_lmessage];
    
    return true;
}

- (void) stuffData:(MessageItem*)item
{
    _u_msg = item.m_msg;
    _u_name = item.u_name;
    _u_time = item.m_time;
    _u_pic  = item.m_pic;
}

-(void) downloadImage:(NSString*) url
{
    NSURL *imageUrl = [NSURL URLWithString:url];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
    self.msg_uiView.image = image;
}

@end
