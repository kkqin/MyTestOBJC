//
//  NameTableViewCell.h
//  MyTestApp
//
//  Created by Gatsby on 9/7/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NameTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *textfiled;

-(void) setPlaceHolder:(NSString*)holdername;

+(instancetype) CellWithTableView:(UITableView *)tableView;

@end
