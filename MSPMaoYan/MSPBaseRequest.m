//
//  MSPBaseRequest.m
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/7/8.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "MSPBaseRequest.h"
#import "MSPHTTPRequest.h"
#import <UIKit/UIKit.h>
#import <MJExtension.h>

@implementation MSPBaseRequest

+ (void)getWithUrl:(NSString *)url
             param:(id)param
       resultClass:(Class)resultClass
           success:(successBlock)success
           failure:(failureBlock)failure
{
    NSDictionary *params = [param mj_keyValues];
    
    [MSPHTTPRequest get:url
                 params:[self requestParams:params]
                success:^(id responseObj) {
        if (success) {
            id result = [resultClass mj_objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 *  返回result下item_list 数组模型
 */
+ (void)postItemListWithURL:(NSString *)url
                      param:(id)param
                resultClass:(Class)resultClass
                    success:(successBlock)success
                       warn:(warnBlock)warn
                    failure:(failureBlock)failure
               tokenInvalid:(blank)tokenInvalid
{
    [self postBaseWithURL:url param:param resultClass:resultClass
                  success:^(id responseObj) {
                      if (!resultClass || !responseObj[@"result"][@"list"]) {
                          success(nil);
                          return;
                      }
                      success([resultClass mj_objectArrayWithKeyValuesArray:responseObj[@"result"][@"list"]]);
                  }
                     warn:warn
                  failure:failure
             tokenInvalid:tokenInvalid];
}

/**
 *  返回result下item_list 数组模型(带HUD)
 */
+ (void)postItemListHUDWithURL:(NSString *)url
                         param:(id)param
                   resultClass:(Class)resultClass
                       success:(successBlock)success
                          warn:(warnBlock)warn
                       failure:(failureBlock)failure
                  tokenInvalid:(blank)tokenInvalid
{
    [self postBaseHUDWithURL:url param:param resultClass:resultClass
                     success:^(id responseObj) {
                         if (!resultClass || !responseObj[@"result"][@"list"]) {
                             success(nil);
                             return;
                         }
                         success([resultClass mj_objectArrayWithKeyValuesArray:responseObj[@"result"][@"list"]]);
                     }
                        warn:warn
                     failure:failure
                tokenInvalid:tokenInvalid];
}

/**
 *  返回result 数据模型
 */
+ (void)postResultWithURL:(NSString *)url
                    param:(id)param
              resultClass:(Class)resultClass
                  success:(successBlock)success
                     warn:(warnBlock)warn
                  failure:(failureBlock)failure
             tokenInvalid:(blank)tokenInvalid
{
    [self postBaseWithURL:url
                    param:param
              resultClass:resultClass
                  success:^(id responseObject){
                      if (!resultClass) {
                          success(nil);
                          return ;
                      }
                      success([resultClass mj_objectArrayWithKeyValuesArray:responseObject[@"result"][@"list"]]);
                  }
                     warn:warn
                  failure:failure
             tokenInvalid:tokenInvalid];
}

/**
 *  返回result 数据模型
 */
+ (void)postResultHUDWithURL:(NSString *)url
                       param:(id)param
                 resultClass:(Class)resultClass
                     success:(successBlock)success
                        warn:(warnBlock)warn
                     failure:(failureBlock)failure
                tokenInvalid:(blank)tokenInvalid
{
    [self postBaseHUDWithURL:url
                    param:param
              resultClass:resultClass
                  success:^(id responseObject){
                      if (!resultClass) {
                          success(nil);
                      }
                      success([resultClass mj_objectArrayWithKeyValuesArray:responseObject[@"result"]]);
                  }
                     warn:warn
                  failure:failure
             tokenInvalid:tokenInvalid];
}

/**
 *  数据模型基类方法
 */
+ (void)postBaseWithURL:(NSString *)url
                  param:(id)param
            resultClass:(Class)resultClass
                success:(successBlock)success
                   warn:(warnBlock)warn
                failure:(failureBlock)failure
           tokenInvalid:(blank)tokenInvalid
{
    // handle url
//    url = [NSString stringWithFormat:@"%@%@",Host,url];
    NSLog(@"request url----->%@",url);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [MSPHTTPRequest post:url
                  params:param
                 success:^(id responseObject){
                     if (success) {
                         NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
                         NSLog(@"request success, response data:%@",dicData);
                         success(responseObject);
                     }
                     [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                 }
                 failure:^(NSError *error){
                     if (failure) {
                         failure(error);
                         NSLog(@"request failure:%@",error);
                     }
                     [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                 }];
}

/**
 *  数据模型基类(带HUD)
 */
+ (void)postBaseHUDWithURL:(NSString *)url param:(id)param
               resultClass:(Class)resultClass
                   success:(successBlock)success
                      warn:(warnBlock)warn
                   failure:(failureBlock)failure
              tokenInvalid:(blank)tokenInvalid
{
//    [SVProgressHUD showWithStatus:@""];
    [self postBaseWithURL:url param:param resultClass:resultClass success:^(id responseObj) {
//        [SVProgressHUD dismiss];    //隐藏loading
        success(responseObj);
    } warn:^(NSString *warnMsg) {
//        [SVProgressHUD dismiss];
        warn(warnMsg);
    } failure:^(NSError *fail) {
//        [SVProgressHUD dismiss];
        failure(fail);
    } tokenInvalid:^{
//        [SVProgressHUD dismiss];
        tokenInvalid();
    }];
}

/**
 *  组合请求参数
 *
 *  @param dict 外部参数字典
 *
 *  @return 返回组合参数
 */
+ (NSMutableDictionary *)requestParams:(NSDictionary *)dict {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    return params;
}
@end
