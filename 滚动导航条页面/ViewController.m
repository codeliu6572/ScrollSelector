//
//  ViewController.m
//  滚动导航条页面
//
//  Created by 刘浩浩 on 16/6/13.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"
#import "ScrollSliderView.h"
@interface ViewController ()
{
    NSArray *titleArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     NSArray *arr = @[@"家电",@"生鲜",@"小饰品",@"Apple全场",@"水果",@"疯狂折扣中",@"Hot美味零食",@"分期优惠",@"特卖专柜衣服",@"日常用品大集合",@"母婴海外"];
    self.view.backgroundColor=[UIColor orangeColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
    ScrollSliderView *scrollSliderView = [[ScrollSliderView alloc]initWithController:self withTitleArray:arr];
    [self.view addSubview:scrollSliderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
