//
//  ViewController.m
//  clearCAShapeLayerPath
//
//  Created by 命运 on 2018/7/25.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

#import "ViewController.h"
#import "customPageControl.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong) customPageControl *myPageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	UIScrollView *scrollView = [UIScrollView new];
	scrollView.frame = CGRectMake(10, 40, width - 20, 200);
	scrollView.backgroundColor = [UIColor greenColor];
	scrollView.contentSize = CGSizeMake((width - 20)*5, 200);
	scrollView.delegate = self;
	scrollView.pagingEnabled = YES;
	scrollView.bounces = NO;
	
	for(int i=0;i<6;i++)
	{
		UIImageView *imageVeiw = [[UIImageView alloc] init];
		imageVeiw.image = [UIImage imageNamed:[NSString stringWithFormat:@"a%d",i]];
		UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
		[imageVeiw addSubview:label];
		label.text = [NSString stringWithFormat:@" 第%d页",i];
		imageVeiw.backgroundColor = [UIColor grayColor];
		imageVeiw.frame = CGRectMake((width - 20)*i, 0, width - 20, 200);
		[scrollView addSubview:imageVeiw];
	}
	[self.view addSubview:scrollView];
	
	
	customPageControl *myPageControl = [[customPageControl alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
	self.myPageControl = myPageControl;
//	myPageControl.backgroundColor = [UIColor purpleColor];
//	myPageControl.pageIndicatorTintColor = [UIColor cyanColor];
	myPageControl.currentPageIndicatorTintColor = [UIColor blueColor];
	myPageControl.numberOfPages = 5;
	myPageControl.currentPage = 0;
	
	
	[self.view addSubview:myPageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	CGFloat size = scrollView.contentOffset.x;
	
	NSInteger index = (size/scrollView.frame.size.width) + 0.5;
	NSLog(@"%f-%ld",size,index);
	self.myPageControl.currentPage = index;
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
