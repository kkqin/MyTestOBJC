//
//  TapMessageView.h
//  MyTestApp
//
//  Created by Gatsby on 11/15/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TapMessageView : UIView

@property (nonatomic, strong) UIButton *sendButton;
- (void) sendMessage:(void(^)(NSString *))inputText;
- (instancetype) initWithFrame:(CGRect)frame PlaceText:(NSString *)placeText PlaceColor:(UIColor *)placeColor;
@end
