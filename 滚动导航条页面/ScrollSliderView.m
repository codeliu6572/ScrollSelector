//
//  ScrollSliderView.m
//  滚动导航条页面
//
//  Created by 刘浩浩 on 16/6/13.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ScrollSliderView.h"
#import "SubViewController.h"
#import "Cache.h"

@implementation ScrollSliderView
{
    Cache *cache;
    CGFloat widthContentSize;
    long int clickCount;

}
/*
 *初始化底部ScrollView
 */
-(UIScrollView *)mainScrollView{
    
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, VIEWWIDTH, VIEWHEIGHT-100)];
        _mainScrollView.bounces = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.backgroundColor = [UIColor lightGrayColor];
        _mainScrollView.delegate = self;
    }
    
    return _mainScrollView;
}
/*
 *初始化self所有的控件
 */
-(id)initWithController:(UIViewController *)controller withTitleArray:(NSArray *)titleArray
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        cache = [[Cache alloc]init];
        _dataArray = [NSArray arrayWithArray:titleArray];
        _fatherController = controller;
        clickCount = 0;
        [self mainScrollView];
        [self addSubview:_mainScrollView];
        
        [self creatSliderScrollView:titleArray];
        _mainScrollView.contentSize = CGSizeMake(titleArray.count*VIEWWIDTH, VIEWHEIGHT - 64 - 36);
        SubViewController *subVC = [SubViewController new];
        subVC.index = 0;
        subVC.tilte = _dataArray[0];
        subVC.view.frame = CGRectMake(0,0, VIEWWIDTH,_mainScrollView.frame.size.height);
        subVC.view.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0) saturation:(arc4random() % 128 / 256.0) + 0.5 brightness:(arc4random() % 128) + 0.5 alpha:1];
        [_mainScrollView addSubview:subVC.view];
        [controller addChildViewController:subVC];
        [cache addCacheSelectIndex:0];
    }
    return self;

}
/*
 *创建滑块
 */
- (void)creatSliderScrollView:(NSArray *)array{
    _sliderScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,64, VIEWWIDTH, 36)];
    _sliderScrollView.backgroundColor = [UIColor whiteColor];
    _sliderScrollView.bounces = NO;
    _sliderScrollView.showsHorizontalScrollIndicator = NO;
    _sliderScrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:_sliderScrollView];
    CGFloat spaceWidth = 6;
    widthContentSize = 0;
    for (NSInteger i = 0; i < array.count; i++) {
        NSString *titleName = self.dataArray[i];
        NSInteger strWidth = [self sizeforWidthWithString:titleName];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIView *sliderSign = [[UIView alloc]initWithFrame:CGRectMake(spaceWidth + widthContentSize,33,strWidth + 10,2)];
        sliderSign.backgroundColor = RAN_COLOR(0xE43494);
        sliderSign.tag = 10000 + i;
        btn.frame = CGRectMake(spaceWidth+widthContentSize,2,strWidth + 10,32);
        [btn setTitle:titleName forState:UIControlStateNormal];
        [btn setTitleColor:RAN_COLOR(0xE43494) forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sliderScrollView addSubview:btn];
        [_sliderScrollView addSubview:sliderSign];
        btn.tag = 20000 + i;
        if (i == 0) {
            btn.selected = YES;
            sliderSign.hidden = NO;
        }else{
            
            sliderSign.hidden = YES;
            
        }
        widthContentSize = strWidth+10+spaceWidth+widthContentSize;
        [btn addTarget:self action:@selector(selectIndexTableViewAndCollectionView:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.sliderScrollView.contentSize = CGSizeMake(widthContentSize + 6, 36);
}
/*
 *计算title的长度
 */
-(NSInteger)sizeforWidthWithString:(NSString *)str
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    CGSize size = [str boundingRectWithSize:CGSizeMake(VIEWWIDTH - 10, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size.width;
}
/*
 *点击滑块按钮响应事件
 */

- (void)selectIndexTableViewAndCollectionView:(UIButton *)sender{
    //按钮点击 先把所有的按钮都不选中 滑动条View隐藏
    for (NSInteger i = 0; i < _dataArray.count; i++) {
        UIButton *btn = (UIButton *)[self viewWithTag:20000 + i];
        UIView *sliderSign = (UIView *)[self viewWithTag:10000 + i];
        sliderSign.hidden = YES;
        btn.selected = NO;
    }
    NSInteger index = sender.tag - 20000;
    self.selectIndex = index;
    //选中 为选中状态
    sender.selected = YES;
    UIView *View = (UIView *)[self viewWithTag:index + 10000];
    View.hidden = NO;
    
    UIButton *btnRight = [_sliderScrollView viewWithTag:sender.tag + 1];
    UIButton *btnLeft = [_sliderScrollView viewWithTag:sender.tag - 2];
    //分页 显示哪个控制器
    _mainScrollView.contentOffset = CGPointMake(index*VIEWWIDTH,0);
    NSLog(@"%f",widthContentSize);
    if (sender.tag > clickCount) {
        if (self.sliderScrollView.contentOffset.x > VIEWWIDTH) {
            if (sender.tag - 20000 != _dataArray.count - 1) {
                [UIView animateWithDuration:0.3f animations:^{
                    self.sliderScrollView.contentOffset = CGPointMake(btnRight.frame.origin.x + btnRight.frame.size.width - VIEWWIDTH, 0);
                }];
            }
           
        }
        else
        {
            [UIView animateWithDuration:0.3f animations:^{
                self.sliderScrollView.contentOffset = CGPointMake(btnLeft.frame.origin.x, 0);
            }];
        }
        
    }
    else
    {
        if (self.sliderScrollView.contentOffset.x > VIEWWIDTH) {
            if (sender.tag - 20000 != _dataArray.count - 1) {
                [UIView animateWithDuration:0.3f animations:^{
                    self.sliderScrollView.contentOffset = CGPointMake(btnRight.frame.origin.x + btnRight.frame.size.width - VIEWWIDTH, 0);
                }];
            }
          
        }
        else
        {
            [UIView animateWithDuration:0.3f animations:^{
                self.sliderScrollView.contentOffset = CGPointMake(btnLeft.frame.origin.x, 0);
            }];
        }

    }
    
    
    if (![cache hasCacheIndex:_selectIndex]) {
        [self addSubController];
        
    }
    NSLog(@"btn.tag%d---lastCount%d",sender.tag,clickCount);

    clickCount = sender.tag;

}
/*
 *创建未创建的滑块对应控制器
 */
-(void)addSubController
{
    SubViewController *subVC = [SubViewController new];
    subVC.index = _selectIndex;
    subVC.tilte = _dataArray[_selectIndex];
    [_mainScrollView addSubview:subVC.view];
    subVC.view.frame = CGRectMake(_selectIndex*VIEWWIDTH,0, VIEWWIDTH,_mainScrollView.frame.size.height);
    subVC.view.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0) saturation:(arc4random() % 128 / 256.0) + 0.5 brightness:(arc4random() % 128) + 0.5 alpha:1];
    [_mainScrollView addSubview:subVC.view];
    
    [_fatherController addChildViewController:subVC];
}
/*
 *UIScrollViewDelegate，控制滑动后变化
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/VIEWWIDTH;
    _selectIndex = index;
    for (NSInteger i = 0; i < _dataArray.count; i++) {
        UIButton *btn = (UIButton *)[self viewWithTag:20000 + i];
        UIView *downSliderView = (UIView *)[self viewWithTag:10000 + i];
        if (index == i) {
            downSliderView.hidden = NO;
            btn.selected = YES;
            
        }else{
            
            downSliderView.hidden = YES;
            btn.selected = NO;
        }
        
    }
    UIButton *btnRight = [_sliderScrollView viewWithTag:index + 1 + 20000];
    UIButton *btnCenter = [_sliderScrollView viewWithTag:index + 20000];
    UIButton *btnLeft = [_sliderScrollView viewWithTag:index - 1 + 20000];
    //分页 显示哪个控制器
    _mainScrollView.contentOffset = CGPointMake(index * VIEWWIDTH,0);
    
    if (btnCenter.tag > clickCount) {
        if (self.sliderScrollView.contentOffset.x > VIEWWIDTH) {
            if (btnCenter.tag - 20000 != _dataArray.count - 1) {
                [UIView animateWithDuration:0.3f animations:^{
                    self.sliderScrollView.contentOffset = CGPointMake(btnRight.frame.origin.x + btnRight.frame.size.width - VIEWWIDTH, 0);
                }];
            }
            
        }
        else
        {
            [UIView animateWithDuration:0.3f animations:^{
                self.sliderScrollView.contentOffset = CGPointMake(btnLeft.frame.origin.x, 0);
            }];
        }
        
    }
    else
    {
        if (self.sliderScrollView.contentOffset.x > VIEWWIDTH) {
            if (btnCenter.tag - 20000 != _dataArray.count - 1) {
                [UIView animateWithDuration:0.3f animations:^{
                    self.sliderScrollView.contentOffset = CGPointMake(btnRight.frame.origin.x + btnRight.frame.size.width - VIEWWIDTH, 0);
                }];
            }

        }
        else
        {
            [UIView animateWithDuration:0.3f animations:^{
                self.sliderScrollView.contentOffset = CGPointMake(btnLeft.frame.origin.x, 0);
            }];
        }
        
    }

    
    NSLog(@"btn.tag%d---lastCount%d",btnCenter.tag,clickCount);

    clickCount = btnCenter.tag;

    if (![cache hasCacheIndex:_selectIndex]) {
        [self addSubController];
        
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
