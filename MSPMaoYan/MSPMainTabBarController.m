//
//  MainTabBarController.m
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/5/11.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "MSPMainTabBarController.h"
#import "MSPNavigationController.h"
#import "MSPMovieViewController.h"
#import "MSPTheaterViewController.h"
#import "MSPDiscoverViewController.h"
#import "MSPMineViewController.h"

#define MYColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@implementation MSPMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MSPMovieViewController *view1 = [[MSPMovieViewController alloc]init];
    [self addViewContronller:view1 title:@"电影" image:@"tabbar_mainframe" selectedImage:@"tabbar_mainframeHL"];
    
    MSPTheaterViewController *view2 = [[MSPTheaterViewController alloc]init];
    [self addViewContronller:view2 title:@"影院" image:@"tabbar_contacts" selectedImage:@"tabbar_contactsHL"];
    
    MSPDiscoverViewController *view3 = [[MSPDiscoverViewController alloc]init];
    [self addViewContronller:view3 title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discoverHL"];
    
    MSPMineViewController *view4 = [[MSPMineViewController alloc]init];
    [self addViewContronller:view4 title:@"我" image:@"tabbar_me" selectedImage:@"tabbar_meHL"];

    self.tabBar.tintColor = [UIColor redColor];
}

- (void)addViewContronller:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    viewController.title = title;
    
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
//    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
//    [viewController.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    MSPNavigationController *navigationController = [[MSPNavigationController alloc] initWithRootViewController:viewController];
    
    [self addChildViewController:navigationController];
}



@end
