//
//  ZFBaseNetworkManager.m
//  Study1
//
//  Created by 彦子凡 on 2018/4/17.
//  Copyright © 2018年 彦子凡. All rights reserved.
//

#import "ZFBaseNetworkManager.h"


/*AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
 session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
 NSDictionary *parDic;
 [session GET:@"https://api.jisuapi.com/news/get?channel=%E5%A4%B4%E6%9D%A1&start=0&num=40&appkey=ae339c7e7f89d35a" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
 NSString *response = (NSString *)responseObject;
 NSLog(@"%@", response);
 } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
 NSLog(@"%@", error);
 }];*/

static AFHTTPRequestOperationManager *manager = nil;

@implementation ZFBaseNetworkManager

+ (AFHTTPRequestOperationManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    });
    return manager;
}

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    return [[self sharedAFManager] GET:path parameters:params success:^void(AFHTTPRequestOperation * operation, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(AFHTTPRequestOperation * operation, NSError * error) {
        complete(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    return [[self sharedAFManager] POST:path parameters:params success:^void(AFHTTPRequestOperation * operation, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(AFHTTPRequestOperation * operation, NSError * error) {
        complete(nil, error);
    }];
}




@end
