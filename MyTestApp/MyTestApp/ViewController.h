//
//  ViewController.h
//  MyTestApp
//
//  Created by Gatsby on 8/28/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainUITableViewController.h"

@interface ViewController : UIViewController<MainTablViewDataSource>

@property NSString *reciveText;
@end

