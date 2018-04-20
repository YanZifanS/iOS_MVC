//
//  ZFBaseNetworkManager.h
//  Study1
//
//  Created by 彦子凡 on 2018/4/17.
//  Copyright © 2018年 彦子凡. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface ZFBaseNetworkManager : NSObject

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;


@end
