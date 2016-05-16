//
//  MSPSegmentedControl.h
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/5/15.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MSPSegmentedControlDelegate <NSObject>

@optional
- (void)clickButton:(NSInteger)index;
@end

@interface MSPSegmentedControl : UIView


/**
 *   delegate
 */
@property (nonatomic, readwrite, weak) id <MSPSegmentedControlDelegate> delegate;


/**
 *   viewcontroller title array
 */
@property (nonatomic, readwrite, copy) NSArray *items;


/**
 *   the color of movingView, default is white
 */
@property (nonatomic, readwrite, strong) UIColor *movingColor;


/**
 *   the color of title, default is white
 */
@property (nonatomic, readwrite, strong) UIColor *titleColor;


/**
 *   the color of selected title, default is red
 */
@property (nonatomic, readwrite, strong) UIColor *titleColorHL;


/**
 *   title size
 */
@property (nonatomic, readwrite, assign) CGFloat titleSize;


/**
 *   current index
 */
@property (nonatomic, readwrite, assign) NSInteger currentIndex;


/**
 *   initialization
 */
+ (instancetype)segmentWithFrame:(CGRect)frame items:(nullable NSArray *)array;


@end
