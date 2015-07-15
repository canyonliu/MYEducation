//
//  MYTabBar.m
//  MYEducation
//
//  Created by WayneLiu on 15/7/15.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//
///底部的工具条

#import "MYTabBar.h"

@implementation MYTabBar
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        //创建按钮
        [self setupButton:@"tabbar_photo"];
        [self setupButton:@"tabbar_mood"];
        [self setupButton:@"tabbar_blog"];
    }
    return self;
    
}

-(void)setupButton:(NSString *)icon{
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [self addSubview:button];
}


@end
