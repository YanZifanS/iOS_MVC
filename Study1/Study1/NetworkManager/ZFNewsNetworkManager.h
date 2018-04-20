//
//  ZFNewsNetworkManager.h
//  Study1
//
//  Created by 彦子凡 on 2018/4/18.
//  Copyright © 2018年 彦子凡. All rights reserved.
//

#import "ZFBaseNetworkManager.h"
#import "ZFNewsModel.h"

@interface ZFNewsNetworkManager : ZFBaseNetworkManager

+ (id)GetListcompletionHandle:(void (^)(id response, NSError *error))completionHandle;

@end
