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
        [self setupButton:@"mycourse" andHightlightedImage:@"mycourse_pressed" andTitle:@"我的课程"];
        [self setupButton:@"course" andHightlightedImage:@"course_pressed" andTitle:@"课程"];
        [self setupButton:@"discuss" andHightlightedImage:@"discuss_pressed" andTitle:@"讨论"];
        [self setupButton:@"mydiscuss" andHightlightedImage:@"mydiscuss_pressed" andTitle:@"我的讨论"];
        [self setupButton:@"rate" andHightlightedImage:@"rate_pressed" andTitle:@"我的消息"];
        [self setupButton:@"news" andHightlightedImage:@"news_pressed" andTitle:@"通知"];
    }
    return self;
    
}

-(void)setupButton:(NSString *)icon andHightlightedImage:(NSString *)highlightedImage  andTitle:(NSString *)title{
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];
//    
    //设置按钮的内容左边对齐
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //设置内边距
    CGFloat inset = 10;
    button.contentEdgeInsets = UIEdgeInsetsMake(0, inset, 0, 0);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, inset*2, 0, 0);
    [self addSubview:button];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    int count  = self.subviews.count;
//    if (IsLanScape) {
//    
//    }

        for (int i = 0; i < count; i++) {
            UIButton *button = self.subviews[i];
            button.height = self.height/count;
            button.width = self.width ;
            button.y = button.height *i;
            button.x = 0;
        }

        


}



@end
