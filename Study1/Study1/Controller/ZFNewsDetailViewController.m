//
//  ZFNewsDetailViewController.m
//  Study1
//
//  Created by yanzifan-mini on 2018/4/20.
//  Copyright © 2018年 彦子凡. All rights reserved.
//

#import "ZFNewsDetailViewController.h"

@interface ZFNewsDetailViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *contentWebView;

@end

@implementation ZFNewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *htmlStr = self.nstrDetailContent;
    [self.contentWebView loadHTMLString: htmlStr baseURL:[NSURL fileURLWithPath: [[NSBundle mainBundle]  bundlePath]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
