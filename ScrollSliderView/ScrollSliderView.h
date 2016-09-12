//
//  ScrollSliderView.h
//  滚动导航条页面
//
//  Created by 刘浩浩 on 16/6/13.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollSliderView : UIView<UIScrollViewDelegate>
#define VIEWWIDTH [UIScreen mainScreen].bounds.size.width
#define VIEWHEIGHT [UIScreen mainScreen].bounds.size.height
#define RAN_COLOR(CUS_RGB) [UIColor colorWithRed:((float)((CUS_RGB & 0xFF0000) >> 16))/255.0 green:((float)((CUS_RGB & 0xFF00) >> 8))/255.0 blue:((float)(CUS_RGB & 0xFF))/255.0 alpha:1.0f]
/*
 *
 *初始化数据
 */
-(id)initWithController:(UIViewController *)controller withTitleArray:(NSArray *)titleArray;
/*
 *底部ScrollView
 */
@property (nonatomic,strong)UIScrollView *mainScrollView;
/*
 *滑块ScrollView
 */
@property (nonatomic,strong)UIScrollView *sliderScrollView;
/*
 *存放title的数组
 */
@property (nonatomic,copy)NSArray *dataArray;
/*
 *点击或滑动后选中的位置
 */
@property (nonatomic, assign) NSInteger selectIndex;
/*
 *所在的控制器
 */
@property (nonatomic,weak)UIViewController *fatherController;
@end
