//
//  MYHomeViewController.m
//  MYEducation
//
//  Created by WayneLiu on 15/7/15.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "MYHomeViewController.h"
#import "MYDock.h"
//dock竖屏时候的宽度
const CGFloat MYDockPW = 70;
//dock横屏时候的宽度
const CGFloat MYDockLW = MYDockPW *3;

const CGFloat MYScreenW = 768;

const CGFloat MYScreenH = 1024;


@interface MYHomeViewController ()

@property (nonatomic, weak)MYDock *dock;

@end

@implementation MYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MYDock *dock = [[MYDock alloc]init];
//    dock.width = 150;
//    dock.height = self.view.height;
    
    [self.view addSubview:dock];
    self.dock =dock;
    
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if(UIInterfaceOrientationIsLandscape(toInterfaceOrientation)==YES){
//        NSLog(@"横屏");
        self.dock.width = MYDockLW;
        self.dock.height = MYScreenW;
        
    }
    else{
        self.dock.height = MYDockPW;
        self.dock.height = MYScreenH;
//        NSLog(@"竖屏");
    }
}



////调用了下面这个方法后(iOS8),上面的willRotateToInterfaceOrientation就不会被调用了
//-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
//{
//    NSLog(@"%@",NSStringFromCGSize(size));
//}




@end
