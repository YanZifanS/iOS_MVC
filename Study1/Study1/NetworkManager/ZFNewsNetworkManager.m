//
//  ZFNewsNetworkManager.m
//  Study1
//
//  Created by 彦子凡 on 2018/4/18.
//  Copyright © 2018年 彦子凡. All rights reserved.
//

#import "ZFNewsNetworkManager.h"

@implementation ZFNewsNetworkManager

//解析也可以放在这边

+ (id)GetListcompletionHandle:(void (^)(id response, NSError *error))completionHandle {
    return [self GET:@"https://api.jisuapi.com/news/get?channel=%E5%A4%B4%E6%9D%A1&start=0&num=40&appkey=ae339c7e7f89d35a" parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle(responseObj, error);
    }];
}

@end
