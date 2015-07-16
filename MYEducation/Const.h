//
//  Const.h
//  Const
//
//  Created by WayneLiu on 15/7/16.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern const CGFloat MYDockPW;
//dock横屏时候的宽度
extern const CGFloat MYDockLW ;

extern const CGFloat MYScreenPW ;

extern const CGFloat MYScreenLW ;

extern NSString *const MYTabBarDidSelectedNotification;
extern NSString *const MYTabBarSelectedIndex;

#define  IsLanScape ([UIScreen  mainScreen].bounds.size.width == MYScreenLW )
#define IsPortrait ([UIScreen  mainScreen].bounds.size.width == MYScreenPW )

#define  MYColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0  blue:b/255.0  alpha:1.0];
#define MYRandomColor MYColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255));


//@interface Const : NSObject
//
//
//
//@end
