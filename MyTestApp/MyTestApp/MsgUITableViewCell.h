//
//  MsgUITableViewCell.h
//  MyTestApp
//
//  Created by Gatsby on 9/2/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KILabel.h"
#import "MessageItem.h"
#import "MainUITableViewController.h"

@interface MsgUITableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView  * _Nullable bookImageView;
@property (nonatomic, strong) UILabel * _Nullable nameLabel;
@property CGRect * _Nullable rect;
@property NSString * _Nullable u_msg;
@property NSString * _Nullable u_time;
@property NSString * _Nullable u_name;
@property NSString * _Nullable u_pic;
@property (nonatomic, strong) UIView * _Nullable head_image;
@property (nonatomic, strong) UIButton * _Nullable name_button;
@property (nonatomic, strong) UILabel * _Nullable llabel;
@property (nonatomic, strong) KILabel * _Nullable lmessage;
@property (nonatomic, strong) UIImageView* _Nullable msg_uiView;
//@property (nonatomic, strong)

- (instancetype _Nonnull)init:(NSInteger * _Nullable)type item:(MessageItem * _Nullable)item reuseIdentifiler:(nullable NSString * )reuseIndentifier;
@end
