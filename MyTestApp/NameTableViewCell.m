//
//  NameTableViewCell.m
//  MyTestApp
//
//  Created by Gatsby on 9/7/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "NameTableViewCell.h"

@implementation NameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype) CellWithTableView:(UITableView *)tableView
{
    NSString *ID = @"cellofname_or_passwd";
    NameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NameTableViewCell" owner:nil options:nil] lastObject];
        //这里需要注意的是为什么是lastObject 应为该Xib中只有一个元素
    }
    return cell;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setPlaceHolder:(NSString*)holdername
{
    self.textfiled.placeholder = holdername;
}

@end
