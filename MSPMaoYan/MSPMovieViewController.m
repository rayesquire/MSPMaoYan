//
//  MSPMovieViewController.m
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/5/11.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "MSPMovieViewController.h"
#import "MSPSegmentedControl.h"
#import "MSPHotViewController.h"
#import "MSPPreviewViewController.h"
#import "MSPAbroadViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface MSPMovieViewController ()  <MSPSegmentedControlDelegate>

@property (nonatomic, readwrite, strong) MSPSegmentedControl *segmentedControl;

@property (nonatomic, readwrite, assign) NSInteger currentPage;

@property (nonatomic, readwrite, strong) MSPHotViewController *hotViewController;

@property (nonatomic, readwrite, strong) MSPPreviewViewController *previewViewController;

@property (nonatomic, readwrite, strong) MSPAbroadViewController *abroadViewController;

@end

@implementation MSPMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _segmentedControl = [MSPSegmentedControl segmentWithFrame:CGRectMake(self.view.frame.size.width / 2 - 90, 5, 180, 30) items:@[@"热映",@"待映",@"海外"]];
    _segmentedControl.delegate = self;
    [self.navigationController.navigationBar addSubview:_segmentedControl];
    _currentPage = _segmentedControl.currentIndex;
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self switchView];
}

#pragma mark - MSPSegmentedControlDelegate
- (void)clickButton:(NSInteger)index {
    _currentPage = index;
    [self switchView];
}

- (void)switchView {
    switch (_currentPage) {
        case 0:
        {
//            self.hotViewController
            break;
        }
        case 1:
        {
//            self.previewViewController
            break;
        }
        case 2:
        {
//            self.abroadViewController
            break;
        }
        default:
            break;
    }
}

#pragma mark - getter
- (MSPHotViewController *)hotViewController {
    if (!_hotViewController) {
        _hotViewController = [[MSPHotViewController alloc] init];
        [self.view addSubview:_hotViewController.view];
    }
    return _hotViewController;
}

- (MSPPreviewViewController *)previewViewController {
    if (!_previewViewController) {
        _previewViewController = [[MSPPreviewViewController alloc] init];
        [self.view addSubview:_previewViewController.view];
    }
    return _previewViewController;
}

- (MSPAbroadViewController *)abroadViewController {
    if (!_hotViewController) {
        _abroadViewController = [[MSPAbroadViewController alloc] init];
        [self.view addSubview:_abroadViewController.view];
    }
    return _abroadViewController;
}
@end
