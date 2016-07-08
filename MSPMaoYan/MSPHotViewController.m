//
//  MSPHotViewController.m
//  MSPMaoYan
//
//  Created by 马了个马里奥 on 16/5/16.
//  Copyright © 2016年 马了个马里奥. All rights reserved.
//

#import "MSPHotViewController.h"
#import "MSPScrollView.h"

@interface MSPHotViewController () <MSPScrollViewDelegate>

@property (nonatomic, readwrite, copy) NSString *movieListString;

@end

@implementation MSPHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    NSString *image1 = [NSString stringWithFormat:@"http://p1.meituan.net/mmc/8827e1c0cd642e34e1ecb5702338e8f447987.jpg"];
    NSString *image2 = [NSString stringWithFormat:@"http://p1.meituan.net/mmc/5e2d388079ac8efca56bbe6b8f4233b460670.jpg"];
    NSString *image3 = [NSString stringWithFormat:@"http://p0.meituan.net/mmc/9f615d49cfcf7210d285b8f745cc622570551.jpg"];
    NSString *image4 = [NSString stringWithFormat:@"http://p0.meituan.net/mmc/e06cea115def37ca7558e3be0ef807ff73880.jpg"];
    NSArray *imageurl = @[image1,image2,image3,image4];
    MSPScrollView *imageScrollView = [MSPScrollView scrollViewWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 64) URLStringsGroup:imageurl];
    imageScrollView.pageControlStyle = MSPScrollViewPageControlStyleNone;
    imageScrollView.delegate = self;
    imageScrollView.autoScrollTimeInterval = 5.0;
    [self.view addSubview:imageScrollView];

    self.movieListString = @"http://api.maoyan.com/mmdb/movie/v3/list/hot.json?uuid=AC27D1C920BEF408EBB7DFB2BBEE32FA416EF5221C9AB833B909395723477686&utm_source=AppStore&utm_term=7.0&utm_content=AC27D1C920BEF408EBB7DFB2BBEE32FA416EF5221C9AB833B909395723477686&version_name=7.0&utm_medium=iphone&movieBundleVersion=100&utm_campaign=AmovieBmovieH0&limit=12&__reqTraceID=5C34ED44-3A9A-4D78-959D-742375642C2B&client=iphone&ci=55&msid=BDFF6541-E340-4DF6-83A5-82E3CB7E1DC42016-07-07-14-51743";
    

}

#pragma mark - MSPScrollViewDelegate
- (void)clickImage:(NSInteger)index {
    
}

@end
