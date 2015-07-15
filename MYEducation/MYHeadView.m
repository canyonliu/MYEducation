//
//  MYHeadView.m
//  MYEducation
//
//  Created by WayneLiu on 15/7/15.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "MYHeadView.h"

@implementation MYHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"HeadPic"] forState:UIControlStateNormal];
        [self setTitle:@"头像" forState:UIControlStateNormal];
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.layer.cornerRadius = 11;
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    if(IsLanScape){
        self.imageView.width = self.width;
        self.imageView.height = self.width;
        self.imageView.y = 0;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.x = 0;
        self.titleLabel.y = self.imageView.height;
        self.titleLabel.width = self.width;
        self.titleLabel.height = self.height - self.imageView.height + 30;
        
    }else{
        
        self.imageView.frame = self.bounds;

        self.titleLabel.hidden = YES;

    }
}
@end
