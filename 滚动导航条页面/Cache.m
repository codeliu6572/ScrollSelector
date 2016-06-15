//
//  Cache.m
//  滚动导航条页面
//
//  Created by 刘浩浩 on 16/6/14.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "Cache.h"

@implementation Cache

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cacheArray = [[NSMutableArray alloc]init];
    }
    return self;
}
-(void)addCacheSelectIndex:(NSInteger)index
{
    [_cacheArray addObject:[NSString stringWithFormat:@"%ld",index]];
}

-(BOOL)hasCacheIndex:(NSInteger)index
{
    BOOL hasIndex = [_cacheArray containsObject:[NSString stringWithFormat:@"%ld",index]];
    if (!hasIndex) {
        [self addCacheSelectIndex:index];
    }
    
    return hasIndex;
}

@end
