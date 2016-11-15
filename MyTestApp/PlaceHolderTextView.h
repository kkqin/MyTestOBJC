//
//  PlaceHolderTextView.h
//  MyTestApp
//
//  Created by Gatsby on 11/15/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceHolderTextView : UITextView
@property (nonatomic, strong) NSString *placeText;
@property (nonatomic, strong) UIColor *placeColor;
@property (nonatomic, assign) BOOL Textnil;

- (instancetype)initWithFrame:(CGRect)frame PlaceText:(NSString *)placeText PlaceColor:(UIColor *)placeColor;
- (void)TextViewSizeChange:(void(^)(CGSize))Textviewsize;

@end
