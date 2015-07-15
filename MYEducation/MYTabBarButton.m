//
//  MYTabBarButton.m
//  MYEducation
//
//  Created by WayneLiu on 15/7/15.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "MYTabBarButton.h"

@implementation MYTabBarButton
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
//            [button setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.adjustsImageWhenDisabled = NO;
        self.adjustsImageWhenHighlighted = NO;
        
        
        
//设置按钮的内容左边对齐
//        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        //设置内边距
//        CGFloat inset = 10;
//        self.contentEdgeInsets = UIEdgeInsetsMake(0, inset, 0, 0);
//        self.titleEdgeInsets = UIEdgeInsetsMake(0, inset*2, 0, 0);
    }
    return self;
}


//-(void)setHighlighted:(BOOL)highlighted{
//    
//}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (IsLanScape) {
        self.imageView.x = 0;
        self.imageView.y = 0;
        self.imageView.height = self.height;
        self.imageView.width =self.width * 0.4;
        
        
        self.titleLabel.hidden = NO;
        self.titleLabel.y = 0;
        self.titleLabel.x = self.imageView.width;
        self.titleLabel.height = self.height;
        self.titleLabel.width = self.width - self.imageView.width;
    }else{
        self.titleLabel.hidden = YES;
        self.imageView.frame = self.bounds;
    }
}

@end
