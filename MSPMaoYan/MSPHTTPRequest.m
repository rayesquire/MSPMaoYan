//
//  MSPHTTPRequest.m
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/7/8.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "MSPHTTPRequest.h"
#import <AFNetworking/AFNetworking.h>

@implementation MSPHTTPRequest

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure {
    // 1.获得请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 2.申明返回的结果是text/html类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 3.设置超时时间为10s
    manager.requestSerializer.timeoutInterval = 10;
    // 4.发送POST请求
    [manager POST:url parameters:params progress:^(NSProgress * progress){
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject){
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure {
    // 1.获得请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 2.申明返回的结果是text/html类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 3.发送GET请求
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
