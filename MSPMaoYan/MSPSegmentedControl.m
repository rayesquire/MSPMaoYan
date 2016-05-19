//
//  MSPSegmentedControl.m
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/5/15.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "MSPSegmentedControl.h"
#import "MSPButton.h"

@interface MSPSegmentedControl ()

@property (nonatomic, readwrite, strong) UIView *movingView;
@property (nonatomic, readwrite, strong) MSPButton *lastButton;
@property (nonatomic, readonly, assign) NSUInteger numberOfSegments;
@property (nonatomic, readwrite, copy) NSArray *items;

@end

@implementation MSPSegmentedControl

#pragma mark - initialization
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    self.layer.cornerRadius = 5;
    self.backgroundColor = [UIColor colorWithRed:227/255.0 green:36/255.0 blue:36/255.0 alpha:1];
    _titleColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    _titleColorHL = [UIColor redColor];
    _movingColor = [UIColor whiteColor];
    _titleSize = 14;
    _currentIndex = 0;
    _items = nil;
}

- (void)updateSegmentedControl {
    if (_numberOfSegments > 0) {
        if (self.subviews.count) {
            for (UIView *view in self.subviews) {
                [view removeFromSuperview];
            }
        }
        for (NSInteger i = 0; i < _numberOfSegments; i++) {
            NSString *title = _items[i];
            MSPButton *button = [self buttonWithTitle:title index:i];
            if (i == _currentIndex) {
                button.selected = YES;
                self.movingView.frame = button.frame;
                [self addSubview:_movingView];
                _lastButton = button;
            }
            [self addSubview:button];
        }
    }
}

- (void)loadData {
    _items = [self.datasource subTitles];
    _numberOfSegments = _items.count;
    [self updateSegmentedControl];
}

- (MSPButton *)buttonWithTitle:(NSString *)title index:(NSInteger)index {
    MSPButton *button = [MSPButton buttonWithType:UIButtonTypeCustom];
    CGFloat width = self.frame.size.width / _numberOfSegments;
    button.frame = CGRectMake(index * width, 0, width, self.frame.size.height);
    button.tag = index;
    button.layer.cornerRadius = 5;
    button.titleSize = _titleSize;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:_titleColor forState:UIControlStateNormal];
    [button setTitleColor:_titleColorHL forState:UIControlStateSelected];
    [button setTitleColor:_titleColorHL forState:UIControlStateHighlighted];
    button.backgroundColor = [UIColor clearColor];
    [button setAdjustsImageWhenHighlighted:NO];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)click:(MSPButton *)button {
    if (button.tag == _currentIndex)
        return;
    
    NSInteger value = button.tag - _currentIndex;
    CGFloat longValue = self.frame.size.width / _numberOfSegments;
    [UIView animateWithDuration:0.2 animations:^{
        _movingView.frame = CGRectMake(_movingView.frame.origin.x + longValue * value, _movingView.frame.origin.y, _movingView.frame.size.width, _movingView.frame.size.height);
        if (self.delegate && [self.delegate respondsToSelector:@selector(clickButton:)]) {
            [self.delegate clickButton:button.tag];
        }
    } completion:^(BOOL finished){
        _currentIndex = button.tag;
        button.selected = YES;
        _lastButton.selected = NO;
        _lastButton = button;
    }];
}

- (void)updateFrame:(CGFloat)percentage {
    CGRect bounds = _movingView.bounds;
    CGFloat offsetX = (CGFloat)percentage * bounds.size.width;
    _movingView.frame = CGRectMake(_currentIndex * bounds.size.width + offsetX, bounds.origin.y, bounds.size.width, bounds.size.height);
}

#pragma mark - getter
- (UIView *)movingView {
    if (!_movingView) {
        _movingView = [[UIView alloc] init];
        _movingView.layer.cornerRadius = 5;
        _movingView.backgroundColor = _movingColor;
    }
    return _movingView;
}

#pragma mark - setter
- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    [self updateSegmentedControl];
}

- (void)setTitleColorHL:(UIColor *)titleColorHL {
    _titleColorHL = titleColorHL;
    [self updateSegmentedControl];
}

- (void)setMovingColor:(UIColor *)movingColor {
    _movingColor = movingColor;
    [self updateSegmentedControl];
}

- (void)setTitleSize:(CGFloat)titleSize {
    _titleSize = titleSize;
    [self updateSegmentedControl];
}

/**
 *   切换界面以后更新segmentedControl中button的状态，此处有待优化
 */
- (void)setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
    [self updateSegmentedControl];
}

- (void)setDatasource:(id<MSPSegmentedControlDatasource>)datasource {
    _datasource = datasource;
    [self loadData];
}

@end
