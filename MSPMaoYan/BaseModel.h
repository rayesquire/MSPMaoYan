//
//  BaseModel.h
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/7/9.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic, readwrite, assign) NSUInteger Id;

@property (nonatomic, readwrite, copy) NSString *name;

@end
