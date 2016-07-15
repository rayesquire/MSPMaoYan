//
//  MovieModel.h
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/7/9.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "BaseModel.h"

@interface MovieModel : BaseModel

@property (nonatomic, readwrite, assign) float mk;     // 电影评分

@property (nonatomic, readwrite, copy) NSString *scm;  // 电影简介

@property (nonatomic, readwrite, copy) NSString *showInfo;  // 放映情况

@property (nonatomic, readwrite, assign) BOOL preShow;  // 是否待映

@property (nonatomic, readwrite, assign) NSUInteger dur;  // 时长

@property (nonatomic, readwrite, copy) NSString *ver;  // 电影格式（2D,3D,IMAX,中国巨幕）

@property (nonatomic, readwrite, copy) NSString *videourl;  // 预告片url

@property (nonatomic, readwrite, copy) NSString *videoName;  // 预告片名称

@property (nonatomic, readwrite, copy) NSString *dir;  // 导演

@property (nonatomic, readwrite, copy) NSArray *headLinesV0;  // 专访









@end
