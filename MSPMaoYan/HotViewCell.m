//
//  HotViewCell.m
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/7/7.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "HotViewCell.h"

@interface HotViewCell ()

@property (nonatomic, readwrite, strong) UIImageView *poster;

@property (nonatomic, readwrite, strong) UILabel *name;

@property (nonatomic, readwrite, strong) UIImageView *threeD;

@property (nonatomic, readwrite, strong) UIImageView *iMax;

@property (nonatomic, readwrite, strong) UILabel *like;

@property (nonatomic, readwrite, strong) UILabel *introduction;

@property (nonatomic, readwrite, strong) UILabel *situation;

@property (nonatomic, readwrite, strong) UIButton *purchase;

@end

@implementation HotViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    
    _poster = [[UIImageView alloc] init];
    _poster.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_poster];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_poster(50)]"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_poster)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_poster(70)]"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_poster)]];
    
    _name = [[UILabel alloc] init];
    _name.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_name];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_poster]-10-[_name]"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_name,_poster)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_name]"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_name)]];
    
    _threeD = [[UIImageView alloc] init];
    _threeD.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_threeD];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_name]-10-[_threeD]"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_threeD,_name)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_threeD]"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_threeD)]];
    
    _iMax = [[UIImageView alloc] init];
    _iMax.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_iMax];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_threeD]-0-[_iMax]"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_iMax,_threeD)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_iMax]"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_iMax)]];
    
    _like = [[UILabel alloc] init];
    _like.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_like];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_like]-10-|"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_like)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[_like]"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_like)]];
    
    _introduction = [[UILabel alloc] init];
    _introduction.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_introduction];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_poster]-10-[_introduction]|"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_introduction,_poster)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_name]-20-[_introduction]"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_introduction,_name)]];
    
    _situation = [[UILabel alloc] init];
    _situation.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_situation];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_poster]-10-[_situation]|"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_situation,_poster)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_introduction]-5-[_situation]"
                                                         options:0
                                                         metrics:nil
                                                         views:NSDictionaryOfVariableBindings(_situation,_introduction)]];
    
    
}

@end
