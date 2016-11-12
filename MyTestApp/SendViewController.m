//
//  SendViewController.m
//  MyTestApp
//
//  Created by Gatsby on 9/6/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "SendViewController.h"

@implementation SendViewController
{
    UILabel *lplacehold;
    UITextView *textview;
    UIImageView *imageMessage;
    int flag;
    NSMutableArray<UIBarButtonItem*> *barArray;
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBar];
    [self addtextview];
    [self addMessageImage];
}

-(void) addBar
{
    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
    
    bar.backgroundColor = [UIColor blueColor];
    
    UINavigationItem *barTitle = [UINavigationItem alloc];
    [bar pushNavigationItem:barTitle animated:YES];
    UIBarButtonItem *baritem = [[UIBarButtonItem alloc] initWithTitle:@"BACK" style:UIBarButtonItemStylePlain target:self action:@selector(baritemBackbtn)];
    
    barTitle.leftBarButtonItem = baritem;
    
    barArray = [[NSMutableArray<UIBarButtonItem *> alloc] init];
    
    baritem = [[UIBarButtonItem alloc] initWithTitle:@"DO" style:UIBarButtonItemStylePlain target:self action:@selector(doSendMsg)];
    UIBarButtonItem *baritem2 = [[UIBarButtonItem alloc] initWithTitle:@"PIC" style:UIBarButtonItemStylePlain target:self action:@selector(doPicture)];
    
    [barArray addObject:baritem];
    [barArray addObject:baritem2];
    
    barTitle.rightBarButtonItems = barArray;
    
    [self.view addSubview:bar];
}

-(void) baritemBackbtn
{
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void) addtextview
{
    textview = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200)];
    textview.delegate = self;
    //textview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textview];
    
    lplacehold = [[UILabel alloc] initWithFrame:CGRectMake(5, -5, 150, 40)];
    lplacehold.backgroundColor = [UIColor clearColor];
    lplacehold.text = @"what's good news...";
    lplacehold.enabled = NO;
    [textview addSubview:lplacehold];
}

-(void) textViewDidChange:(UITextView *)textView
{
    if ([textView.text  isEqual: @""])
    {
        lplacehold.text = @"what's good news...";
    }
    else
    {
        lplacehold.text = @"";
    }
}

-(void) addMessageImage
{
    imageMessage = [[UIImageView alloc] init];
    imageMessage.frame = CGRectMake(0, 250, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 550);
    //imageMessage.backgroundColor = [UIColor brownColor];
    [self.view addSubview:imageMessage];
}

-(NSString *)imageBase64WithDataURL:(UIImage *)image
{
    NSData *imageData =nil;
    NSString *mimeType =nil;
    
    //图片要压缩的比例，此处100根据需求，自行设置
    CGFloat x =100 / image.size.height;
    if (x >1)
    {
        x = 1.0;
    }
    imageData = UIImageJPEGRepresentation(image, x);
    mimeType = @"image/jpeg";
    return [NSString stringWithFormat:@"data:%@;base64,%@", mimeType, [imageData base64EncodedStringWithOptions:0]];
}

-(NSString *)imageWithDataURL:(UIImage *)image
{
    NSData *imageData =nil;
    NSString *mimeType =nil;

    CGFloat x =100 / image.size.height;
    if (x >1)
    {
        x = 1.0;
    }
    
    imageData = UIImageJPEGRepresentation(image, x);
    mimeType = @"image/jpeg";
    return [NSString stringWithFormat:@"%@", imageData];
}

-(void) doSendMsg
{
    if([self hasAllTheBlankSpace])
    {
        UIAlertController *alert = [UIAlertController  alertControllerWithTitle:@"WARNING" message:@"you enter is empty can't do" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    NSDate *datetime = [[NSDate alloc] init];
    NSDateFormatter *dformatter = [[NSDateFormatter alloc] init];
    dformatter.dateFormat = @"yyy-MM-dd HH:mm:ss";
    
    MessageItem *m_item = [[MessageItem alloc] init];
    m_item.u_id = @"10001";
    m_item.m_id = @"20090";
    m_item.m_msg = textview.text;
    m_item.m_time = [dformatter stringFromDate:datetime];
    m_item.m_type = 1;
    m_item.m_pic = [self imageBase64WithDataURL:imageMessage.image];
    
    MessageBL * mbl = [[MessageBL alloc] retain] ;
    mbl.delegateForMessagesBL = self;
    [mbl putOneselfMessageToBL:m_item];
    
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void) doPicture
{
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"PICTURING" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    [sheet addAction:[UIAlertAction actionWithTitle:@"LOCAL PICTURE" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = true;
        picker.delegate = self;
        picker.allowsEditing = true;
        [self presentViewController:picker animated:true completion:^{
            ;
        }];
    }]];
    
    [sheet addAction:[UIAlertAction actionWithTitle:@"CANCLE" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:sheet animated:YES completion:nil];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo
{
    UIImage *img = [editingInfo objectForKey:UIImagePickerControllerEditedImage];
    
    if (img == nil) {
        // 如果沒有編輯 則是取得原始拍照的照片 UIImage
        img = [editingInfo objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    imageMessage.image = img;
    flag = 1;
    
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (BOOL) hasAllTheBlankSpace
{
    NSString *rawString = [textview text];
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [rawString stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] == 0)
    {
        return true;
    }
    
    return false;
}

@end
