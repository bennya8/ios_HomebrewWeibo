//
//  StatusCell.h
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/17/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StatusCellFrame;

@interface StatusCell : UITableViewCell

@property (strong, nonatomic) UILabel *text;

@property (strong, nonatomic) UILabel *screenName;

@property (strong, nonatomic) StatusCellFrame *statusCellFrame;



@end
