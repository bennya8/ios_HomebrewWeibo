//
//  StatusCell.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/17/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "StatusCell.h"

@implementation StatusCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _text = [[UILabel alloc]init];

    }
    return self;
}


@end
