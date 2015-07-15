//
//  MYDock.m
//  MYEducation
//
//  Created by WayneLiu on 15/7/15.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "MYDock.h"
#import "MYToorBar.h"
#import "MYTabBar.h"
#import "MYHeadView.h"

@interface MYDock()

@property (nonatomic ,weak) MYHeadView *headView;
@property (nonatomic ,weak) MYTabBar  *tabBar;
@property (nonatomic ,weak) MYToorBar  *toorBar;

@end
@implementation MYDock

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //self.backgroundColor = [UIColor redColor];
//        1.设置头像
        MYHeadView *headview = [[MYHeadView alloc]init];
        [self addSubview:headview];
        self.headView = headview;
        
//        2.tabbar选项卡
        MYTabBar *tabbar = [[MYTabBar alloc]init];
        [self addSubview:tabbar];
        self.tabBar = tabbar;
        
//        3.toorbar工具条
        MYToorBar *toorbar = [[MYToorBar alloc]init];
        //toorbar.backgroundColor = [UIColor blueColor];
        [self addSubview:toorbar];
        self.toorBar = toorbar;
        
        
    }
    return   self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.toorBar.width = self.width;
    
    
    if (IsLanScape) {
//        NSLog(@"横屏");
        self.toorBar.height = self.width/3;
    }else{
//         NSLog(@"竖屏");
        self.toorBar.height = self.width*3;
    }
    self.toorBar.y = self.height - self.toorBar.height;
}

@end
