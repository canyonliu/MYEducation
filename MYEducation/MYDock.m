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
        //tabbar.backgroundColor = [UIColor blueColor];
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
    
    
    self.tabBar.width = self.width;
    self.toorBar.width = self.width;
    
    
    if (IsLanScape) {
//        NSLog(@"横屏");
        self.tabBar.height = self.width *3;  //self.tabBar.subviews.count;
        self.toorBar.height = self.width/self.toorBar.subviews.count;
    }else{
//         NSLog(@"竖屏");
        self.tabBar.height = self.width * 6;
        self.toorBar.height = self.width*self.toorBar.subviews.count;
    }
    self.tabBar.y = self.height - self.toorBar.height - self.tabBar.height;
    self.toorBar.y = self.height - self.toorBar.height;
}

@end
