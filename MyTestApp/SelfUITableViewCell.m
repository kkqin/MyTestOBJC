//
//  SelfUITableViewCell.m
//  MyTestApp
//
//  Created by Gatsby on 11/14/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

#import "SelfUITableViewCell.h"

@implementation SelfUITableViewCell
{
    UIImageView *headImageView;
    UILabel *nameLabel;
    UIButton *followerButton;
    UILabel *followerLabel;
    UIButton *followingButton;
    UILabel *followingLabel;
    UILabel *speakLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (instancetype)init
{
    self = [super init];
    [self rebuildInterface];
    return self;
}

- (void) rebuildInterface
{
    //
    //self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1_areskris.jpg"]];
    headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"without_pic"]];
    headImageView.frame = CGRectMake(20, 20, 100, 100);
    headImageView.backgroundColor = [UIColor orangeColor];
   
    nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(140, 20, 100, 30);
    nameLabel.text = @"admin";
    
    followerButton = [[UIButton alloc] init];
    followerButton.frame = CGRectMake(140, 70, 100, 20);
    [followerButton setTitle:@"followers" forState:UIControlStateNormal];
    [followerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [followerButton addTarget:self action:@selector(sendNotificationFollowers) forControlEvents:UIControlEventTouchUpInside];
    
    followerLabel = [[UILabel alloc] init];
    followerLabel.frame = CGRectMake(260, 70, 100, 20);
    followerLabel.text = @"12";
    
    followingButton = [[UIButton alloc] init];
    followingButton.frame = CGRectMake(140, 100, 100, 20);
    [followingButton setTitle:@"following" forState:UIControlStateNormal];
    [followingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [followingButton addTarget:self action:@selector(sendNotificationFollowing) forControlEvents:UIControlEventTouchUpInside];
    
    followingLabel = [[UILabel alloc] init];
    followingLabel.frame = CGRectMake(260, 100, 100, 20);
    followingLabel.text = @"1";
    
    speakLabel = [[UILabel alloc] init];
    speakLabel.frame = CGRectMake(20, 150, 300, 20);
    speakLabel.text = @"-- some day I feel like shit.";
    
    [self addSubview:headImageView];
    [self addSubview:nameLabel];
    [self addSubview:followerButton];
    [self addSubview:followerLabel];
    [self addSubview:followingButton];
    [self addSubview:followingLabel];
    [self addSubview:speakLabel];
}

-(void) sendNotificationFollowers
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AskFollowerDetailView" object:nil];
}

-(void) sendNotificationFollowing
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AskFolloingDetailView" object:nil];
}

@end
