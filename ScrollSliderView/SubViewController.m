//
//  SubViewController.m
//  滚动导航条页面
//
//  Created by 刘浩浩 on 16/6/14.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "SubViewController.h"
#define VIEWWIDTH [UIScreen mainScreen].bounds.size.width
#define VIEWHEIGHT [UIScreen mainScreen].bounds.size.height
#define RAN_COLOR(CUS_RGB) [UIColor colorWithRed:((float)((CUS_RGB & 0xFF0000) >> 16))/255.0 green:((float)((CUS_RGB & 0xFF00) >> 8))/255.0 blue:((float)(CUS_RGB & 0xFF))/255.0 alpha:1.0f]

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
    label.layer.borderColor = [UIColor whiteColor].CGColor;
    label.layer.borderWidth = 1;
    label.text = [NSString stringWithFormat:@"%ld:%@",_index,_tilte];
    label.center = self.view.center;
    label.textColor = [UIColor orangeColor];
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
