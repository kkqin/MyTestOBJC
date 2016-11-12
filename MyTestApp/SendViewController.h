//
//  SendViewController.h
//  MyTestApp
//
//  Created by Gatsby on 9/6/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageBL.h"

@interface SendViewController : UIViewController<UITextViewDelegate, MessageBLDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end
