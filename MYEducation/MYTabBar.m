//
//  MYTabBar.m
//  MYEducation
//
//  Created by WayneLiu on 15/7/15.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//
///底部的工具条

#import "MYTabBar.h"
#import "MYTabBarButton.h"
@interface MYTabBar()
@property (nonatomic ,weak) MYTabBarButton  *selectedTabbarButton;

@end

@implementation MYTabBar
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        
        // 创建按钮
        MYTabBarButton *firstButton = [self setupButton:@"mycourse" andHightlightedImage:@"mycourse_pressed" andTitle:@"我的课程"];
        firstButton.enabled = NO;
        self.selectedTabbarButton = firstButton;
        //创建按钮
//        [self setupButton:@"mycourse" andHightlightedImage:@"mycourse_pressed" andTitle:@"我的课程"];
        [self setupButton:@"course" andHightlightedImage:@"course_pressed" andTitle:@"课程"];
        [self setupButton:@"discuss" andHightlightedImage:@"discuss_pressed" andTitle:@"讨论"];
        [self setupButton:@"mydiscuss" andHightlightedImage:@"mydiscuss_pressed" andTitle:@"我的讨论"];
        [self setupButton:@"rate" andHightlightedImage:@"rate_pressed" andTitle:@"我的消息"];
        [self setupButton:@"news" andHightlightedImage:@"news_pressed" andTitle:@"通知"];
    }
    return self;
    
}

-(MYTabBarButton *)setupButton:(NSString *)icon andHightlightedImage:(NSString *)highlightedImage  andTitle:(NSString *)title{
    MYTabBarButton *button = [[MYTabBarButton alloc]init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
//添加按钮事件
    [button addTarget:self action:@selector(tabbarButtonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    return  button;
}

-(void)tabbarButtonClick:(MYTabBarButton *)tabbutton{
    self.selectedTabbarButton.enabled = YES;
    tabbutton.enabled = NO; // 按钮button 如果进入高亮状态/disasble,图标默认会变灰
    self.selectedTabbarButton = tabbutton;
    
    //发出通知
    [[NSNotificationCenter defaultCenter]postNotificationName:MYTabBarDidSelectedNotification   object:nil userInfo:@{MYTabBarSelectedIndex : @(tabbutton.tag)}];
}




-(void)layoutSubviews{
    [super layoutSubviews];
    int count  = self.subviews.count;
    
//        if (IsLanScape) {
//    
//        }

        for (int i = 0; i < count; i++) {
            MYTabBarButton *button = self.subviews[i];
            button.height = self.height/count;
            button.width = self.width ;
            button.y = button.height *i;
            button.x = 0;
            button.tag = i;
        }

        


}



@end
