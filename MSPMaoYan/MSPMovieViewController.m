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
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height - 64

@interface MSPMovieViewController ()  <MSPSegmentedControlDelegate,MSPSegmentedControlDatasource,UIScrollViewDelegate>

@property (nonatomic, readwrite, strong) MSPSegmentedControl *segmentedControl;

@property (nonatomic, readwrite, assign) NSInteger currentPage;

@property (nonatomic, readwrite, strong) UIScrollView *scrollView;

@property (nonatomic, readwrite, strong) UIView *leftView;

@property (nonatomic, readwrite, strong) UIView *centerView;

@property (nonatomic, readwrite, strong) UIView *rightView;

@property (nonatomic, readwrite, strong) MSPHotViewController *hotViewController;

@property (nonatomic, readwrite, strong) MSPPreviewViewController *previewViewController;

@property (nonatomic, readwrite, strong) MSPAbroadViewController *abroadViewController;

@end

@implementation MSPMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _segmentedControl = [[MSPSegmentedControl alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 90, 5, 180, 30)];
    _segmentedControl.delegate = self;
    _segmentedControl.datasource = self;
    [self.navigationController.navigationBar addSubview:_segmentedControl];
    _currentPage = _segmentedControl.currentIndex;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, 0);
    _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH * _currentPage, 0);
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    self.hotViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.previewViewController.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.abroadViewController.view.frame = CGRectMake(SCREEN_HEIGHT * 2, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [_scrollView addSubview:self.hotViewController.view];
    [_scrollView addSubview:self.previewViewController.view];
    [_scrollView addSubview:self.abroadViewController.view];
    
    
    
    
    
    
}

#pragma mark - MSPSegmentedControlDelegate
- (void)clickButton:(NSInteger)index {
    _currentPage = index;
}

#pragma mark - MSPSegmentedControlDatasource
- (NSArray *)subTitles {
    return @[@"热映",@"待映",@"海外"];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"did end decelerating contentoffset.x: %d",(int)scrollView.contentOffset.x);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"did end scrollingAnimation contentoffset.x: %d",(int)scrollView.contentOffset.x);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)reloadView {
    CGPoint offset = _scrollView.contentOffset;
    if (offset.x > SCREEN_WIDTH) {
        _currentPage ++;
    }
    else if (offset.x < SCREEN_WIDTH) {
        _currentPage --;
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
