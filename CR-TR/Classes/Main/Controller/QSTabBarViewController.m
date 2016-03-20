//
//  QSTabBarViewController.m
//  CR-TR
//
//  Created by qswdzy on 16/3/12.
//  Copyright © 2016年 qswdzy. All rights reserved.
//

#import "QSTabBarViewController.h"
#import "QSHomeViewController.h"
#import "QSIntroduceViewController.h"
#import "QSUppgradeViewController.h"
#import "QSOtherViewController.h"
#import "QSNavigationController.h"

@interface QSTabBarViewController ()

@end

@implementation QSTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    
    // 1.初始化子控制器
    QSHomeViewController *home = [[QSHomeViewController alloc] init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    QSIntroduceViewController *introduce = [[QSIntroduceViewController alloc] init];
    [self addChildVc:introduce title:@"介绍" image:@"compose_keyboardbutton_background" selectedImage:@"compose_keyboardbutton_background_highlighted"];
    
    QSUppgradeViewController *uppgrade = [[QSUppgradeViewController alloc] init];
    [self addChildVc:uppgrade title:@"升级" image:@"compose_trendbutton_background" selectedImage:@"compose_trendbutton_background_highlighted"];
    
    QSOtherViewController *other = [[QSOtherViewController alloc] init];
    [self addChildVc:other title:@"其他" image:@"tabbar_profile_selected" selectedImage:@"tabbar_profile_selected"];
}


- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title;
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = HWColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    childVc.view.backgroundColor = HWRandomColor;
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
   QSNavigationController *nav = [[QSNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}
@end
