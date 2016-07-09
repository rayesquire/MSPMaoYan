//
//  MSPBaseRequest.h
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/7/8.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(id result);

typedef void(^warnBlock)(NSString *warnMsg);

typedef void(^failureBlock)(NSError *error);

typedef void(^blank)();

@interface MSPBaseRequest : NSObject

+ (void)getWithUrl:(NSString *)url
             param:(id)param
       resultClass:(Class)resultClass
           success:(successBlock)success
           failure:(failureBlock)failure;

/**
 *  返回result下item_list 数组模型
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param resultClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调
 *  @param warn         请求失败后警告提示语
 *  @param failure      请求失败后的回调
 *  @param tokenInvalid token过期后的回调
 */
+ (void)postItemListWithURL:(NSString *)url param:(id)param
                resultClass:(Class)resultClass
                    success:(successBlock)success
                       warn:(warnBlock)warn
                    failure:(failureBlock)failure
               tokenInvalid:(blank)tokenInvalid;

/**
 *  返回result下item_list 数组模型（带HUD）
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param resultClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调
 *  @param warn         请求失败后警告提示语
 *  @param failure      请求失败后的回调
 *  @param tokenInvalid token过期后的回调
 */
+ (void)postItemListHUDWithURL:(NSString *)url param:(id)param
                   resultClass:(Class)resultClass
                       success:(successBlock)success
                          warn:(warnBlock)warn
                       failure:(failureBlock)failure
                  tokenInvalid:(blank)tokenInvalid;
/**
 *  返回result 数据模型
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param resultClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调
 *  @param warn         请求失败后警告提示语
 *  @param failure      请求失败后的回调
 *  @param tokenInvalid token过期后的回调
 */
+ (void)postResultWithURL:(NSString *)url
                    param:(id)param
              resultClass:(Class)resultClass
                  success:(successBlock)success
                     warn:(warnBlock)warn
                  failure:(failureBlock)failure
             tokenInvalid:(blank)tokenInvalid;

/**
 *  返回result 数据模型 (带HUD)
 *
 *  @param url          请求地址
 *  @param param        请求参数
 *  @param resultClass  需要转换返回的数据模型
 *  @param success      请求成功后的回调
 *  @param warn         请求失败后警告提示语
 *  @param failure      请求失败后的回调
 *  @param tokenInvalid token过期后的回调
 */
+ (void)postResultHUDWithURL:(NSString *)url param:(id)param
                 resultClass:(Class)resultClass
                     success:(successBlock)success
                        warn:(warnBlock)warn
                     failure:(failureBlock)failure
                tokenInvalid:(blank)tokenInvalid;


@end
