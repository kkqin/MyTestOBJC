//
//  MyNavigationController.h
//  MyTestApp
//
//  Created by Gatsby on 9/2/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyNavPRO <NSObject>
@optional
-(void) didturnToSelfDetailView;
@end

@interface MyNavigationController : UINavigationController

@property (nonatomic, assign) id<MyNavPRO> myNavDelegate;

@end
