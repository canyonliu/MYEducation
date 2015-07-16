//
//  MYHomeViewController.m
//  MYEducation
//
//  Created by WayneLiu on 15/7/15.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "MYHomeViewController.h"
#import "MYDock.h"
#import "Masonry.h"


@interface MYHomeViewController ()

@property (nonatomic, weak)MYDock *dock;
/**
 *
 */
@property (nonatomic ,weak) UIViewController  *showingVC;

@end

@implementation MYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ///初始化子控制器
    [self setupChildVCs];
    self.view.backgroundColor = MYColor(55, 55, 55);
    
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
    
    //监听通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tabbarChanged:) name:MYTabBarDidSelectedNotification object:nil];
   

}

///懒加载
-(MYDock *)dock{
    if(!_dock){
        MYDock *dock = [[MYDock alloc]init];
        [self.view addSubview:dock];
        self.dock = dock;
    }
    return _dock;
}



-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

///初始化MyDock
//-(void)setupDock{
//    
//    MYDock *dock = [[MYDock alloc]init];
//    //    dock.width = 150;
//    //    dock.height = self.view.height;
//    [self.view addSubview:dock];
//    self.dock =dock;
//    
//}
///初始化子控制器
-(void)setupChildVCs{
    for (int i = 0; i < 6 ; i++) {
        UIViewController *VC1 = [[UIViewController alloc]init];
        VC1.view.backgroundColor = MYRandomColor;
        [self addChildViewController:VC1];
    }
  [self switchChildVC:0];
}

-(void)tabbarChanged:(NSNotification *)notification{
    int index = [notification.userInfo[MYTabBarSelectedIndex]intValue];
    [self switchChildVC:index];

}

-(void)switchChildVC:(int )index{
    ///移除当前正在显示的控制器,换成下面的那个
    [self.showingVC.view removeFromSuperview];
    
    ///显示当前index对应的控制器
    UIViewController *newChildVC = self.childViewControllers[index];
    //    newChildVC.view.y = 0;
    //    newChildVC.view.x = self.dock.width;//MYDockLW;
    //    newChildVC.view.height = self.view.height;
    //    newChildVC.view.width = 600;
    
    
    ///先添加视图,在约束!
    [self.view addSubview:newChildVC.view];
    self.showingVC = newChildVC;
    
    ///使用masonry
    [newChildVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.width.mas_equalTo(600);   // make.width.equalTo(@600);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);//make.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.dock.mas_right);
        
    }];
    //    除了masonry,还可以使用更为轻量级的框架:
    //    UIView+Autolayout.h
    //    UIView+Autolayout.m
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if(UIInterfaceOrientationIsLandscape(toInterfaceOrientation)==YES){
//        NSLog(@"横屏");
        self.dock.width = MYDockLW;
        self.dock.height = MYScreenPW;
   
    }
    else{
        self.dock.width = MYDockPW;
        self.dock.height = MYScreenLW;
//        NSLog(@"竖屏");
    }
    
    /////**没有使用masonry时候的约束右边子控制器*//
    /*
//        self.showingVC.view.autoresizingMask = UIViewAutoresizingNone;
//        self.showingVC.view.x = self.dock.width;
//        self.showingVC.view.width = 600;
//        self.showingVC.view.y = 0;
//        self.showingVC.view.height = self.dock.height;
    //默认情况下,所有控制器的view.autoresizingMask都包括了 UIViewAutoresizingFlexibleHeight 和 UIViewAutoresizingFlexibleWidth
    //默认情况下所有控制器的宽高都会跟随父控制器而改
     */
}



////调用了下面这个方法后(iOS8),上面的willRotateToInterfaceOrientation就不会被调用了
//-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
//{
//    NSLog(@"%@",NSStringFromCGSize(size));
//}




@end
