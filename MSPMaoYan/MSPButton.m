//
//  MSPButton.m
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/5/16.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "MSPButton.h"

@implementation MSPButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat titleX = self.frame.size.width * 0.25;
    CGFloat titleY = self.frame.size.height * 0.25;
    CGFloat titleWidth = self.frame.size.width * 0.5;
    CGFloat titleHeight = self.frame.size.height * 0.5;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleWidth, titleHeight);
    self.titleLabel.font = [UIFont boldSystemFontOfSize:_titleSize];
    self.titleLabel.backgroundColor = [UIColor clearColor];
}

- (void)setTitleSize:(CGFloat)titleSize {
    _titleSize = titleSize;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:titleSize];
}


@end
