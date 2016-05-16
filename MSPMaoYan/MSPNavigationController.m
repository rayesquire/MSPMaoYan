//
//  MSPNavigationController.m
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/5/11.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "MSPNavigationController.h"

@implementation MSPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationBar.barTintColor = [UIColor redColor];

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

@end
