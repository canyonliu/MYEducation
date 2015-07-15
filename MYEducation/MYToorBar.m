//
//  MYToorBar.m
//  MYEducation
//
//  Created by WayneLiu on 15/7/15.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "MYToorBar.h"

@implementation MYToorBar

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

-(void)layoutSubviews{
    [super layoutSubviews];
    int count  = self.subviews.count;
    
    if(IsLanScape){
        for (int i = 0; i < count; i++) {
            UIButton *button = self.subviews[i];
            button.height = self.height;
            button.width = self.width /count;
            button.y = 0;
            button.x = button.width *i;
        }
    }else{
        for (int i = 0; i < count; i++) {
            UIButton *button = self.subviews[i];
            button.height = self.height/count;
            button.width = self.width;
            button.x = 0;
            button.y = button.height *i;
        }
        
 
        
    }
}
@end
