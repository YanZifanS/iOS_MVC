//
//  ZFNewsViewController.m
//  Study1
//
//  Created by 彦子凡 on 2018/4/17.
//  Copyright © 2018年 彦子凡. All rights reserved.
//

#import "ZFNewsViewController.h"

#import "YYModel.h"
#import "ZFNewsModel.h"
#import "ZFNewsCell.h"
#import "ZFNewsNetworkManager.h"
#import "ZFNewsDetailViewController.h"

@interface ZFNewsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)NSMutableArray *dataArray;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ZFNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"爆炸新闻";
    [self GetData];
    [self addTableView];
}

- (void)GetData {
    [ZFNewsNetworkManager GetListcompletionHandle:^(id response, NSError *error) {
        NSDictionary *responseDic = (NSDictionary *)response;
        ZFNewsModel *model = [ZFNewsModel yy_modelWithDictionary:responseDic];
        NSInteger nStatus = model.status;
        if (nStatus != 0) {
            NSLog(@"请求失败!");
            return;
        }
        NSDictionary *resultDic = [model valueForKey:@"result"];
        NSArray *listArray = [resultDic valueForKey:@"list"];
        self.dataArray = [[NSMutableArray alloc]init];
        [self.dataArray removeAllObjects];
        for (id obj in listArray) {
            NSDictionary *objDic = (NSDictionary *)obj;
            ZFListModel *listModel = [ZFListModel yy_modelWithDictionary:objDic];
            NSLog(@"%@\n\n\n", listModel.pic);
            [self.dataArray addObject:listModel];
        }
        [self.tableView reloadData];
    }];
}

- (void)addTableView {
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZFNewsCell"];
    cell = [[[NSBundle mainBundle]loadNibNamed:@"ZFNewsCell" owner:nil options:nil]firstObject];
    ZFListModel *listModel  = self.dataArray[indexPath.row];
    cell.webAdressLabel.text = listModel.src;
    cell.contentLabel.text = listModel.title;
    cell.timeLabel.text = listModel.time;
    NSLog(@"%@", listModel.time);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZFListModel *listModel  = self.dataArray[indexPath.row];
    ZFNewsDetailViewController *vc = [[ZFNewsDetailViewController alloc]init];
    vc.nstrDetailContent = listModel.content;
    [self.navigationController pushViewController:vc animated:YES];
    //取消选中
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
