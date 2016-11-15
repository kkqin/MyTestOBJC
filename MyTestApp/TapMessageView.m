//
//  TapMessageView.m
//  MyTestApp
//
//  Created by Gatsby on 11/15/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "TapMessageView.h"
#import "PlaceHolderTextView.h"

@interface TapMessageView()
{
    CGFloat maxy;
}

@property (nonatomic, strong)PlaceHolderTextView *Inputview;
@property (nonatomic, strong)void(^sendText)(NSString *);
@end

@implementation TapMessageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype) initWithFrame:(CGRect)frame PlaceText:(NSString *)placeText PlaceColor:(UIColor *)placeColor
{
    self = [super initWithFrame:frame];
    [self addSubview:[self addUpline]];
    return self;
}

-(UIView *)addUpline
{
    //CGFloat *height;
    return [UIView alloc];
}

@end
