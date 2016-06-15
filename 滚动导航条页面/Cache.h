//
//  Cache.h
//  滚动导航条页面
//
//  Created by 刘浩浩 on 16/6/14.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cache : NSObject
@property(nonatomic ,strong)NSMutableArray *cacheArray;
- (instancetype)init;
-(void)addCacheSelectIndex:(NSInteger)index;
-(BOOL)hasCacheIndex:(NSInteger)index;

@end
