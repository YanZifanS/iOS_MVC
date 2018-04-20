//
//  ZFNewsModel.h
//  Study1
//
//  Created by 彦子凡 on 2018/4/17.
//  Copyright © 2018年 彦子凡. All rights reserved.
//

#import "ZFBaseModel.h"
/*{
 "status": "0",
 "msg": "ok",
 "result": {
    "channel": "头条",
    "num": "10",
    "list": [
 {
 "title": "中国开闸放水27天解救越南旱灾",
 "time": "2016-03-16 07:23",
 "src": "中国网",
 "category": "mil",
 "pic": "http://api.jisuapi.com/news/upload/20160316/105123_31442.jpg",
 "content": "<p class="\"art_t\"">　　原标题：防总：应越南请求 中方启动澜沧江水电站水量应急调度</p><p class="\"art_t\"">　　记者从国家防总获悉，应越南社会主义共和国请求，我方启动澜沧江梯级水电站水量应急调度，缓解湄公河流域严重旱情。3月15日8时，澜沧江景洪水电站下泄流量已加大至2190立方米每秒，标志着应越方请求，由我方实施的澜沧江梯级水电站水量应急调度正式启动。</p>",
 "url": "http://mil.sina.cn/zgjq/2016-03-16/detail-ifxqhmve9235380.d.html?vt=4&pos=108",
 "weburl": "http://mil.news.sina.com.cn/china/2016-03-16/doc-ifxqhmve9235380.shtml"
 }
 ]
 }
 }*/
@class ZFResultModel, ZFListModel;

@interface ZFNewsModel : ZFBaseModel
@property (assign, nonatomic) NSInteger status;
@property (copy, nonatomic) NSString *msg;
@property (strong, nonatomic) ZFResultModel *result;
@end

@interface ZFResultModel : ZFBaseModel
@property (copy, nonatomic) NSString *channel;
@property (assign, nonatomic) NSInteger num;
@property (strong, nonatomic) NSArray<ZFListModel *> *list;
@end


@interface ZFListModel : ZFBaseModel
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *time;
@property (copy, nonatomic) NSString *src;
@property (copy, nonatomic) NSString *pic;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *category;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *weburl;
@end









