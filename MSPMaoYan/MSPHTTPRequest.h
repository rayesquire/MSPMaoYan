//
//  MSPHTTPRequest.h
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/7/8.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  请求成功的block
 *  @param responseObject 返回数据
 */
typedef void (^successBlock)(id responseObject);

/**
 *  请求失败的block
 *  @param error 失败信息
 */
typedef void (^failureBlock)(NSError *error);


@interface MSPHTTPRequest : NSObject

/**
 *  发送一个post请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

@end
