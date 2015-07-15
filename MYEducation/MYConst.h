//
//  MYConst.h
//  MYEducation
//
//  Created by WayneLiu on 15/7/15.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

//extern const CGFloat MYPortrait;
//dock竖屏时候的宽度
extern const CGFloat MYDockPW;
//dock横屏时候的宽度
extern const CGFloat MYDockLW ;

extern const CGFloat MYScreenPW ;

extern const CGFloat MYScreenLW ;


#define  IsLanScape ([UIScreen  mainScreen].bounds.size.width == MYScreenLW )
#define IsPortrait ([UIScreen  mainScreen].bounds.size.width == MYScreenPW )

#define  rgb(r,g,b);