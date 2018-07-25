//
//  customPageControl.m
//  clearCAShapeLayerPath
//
//  Created by 命运 on 2018/7/25.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

#import "customPageControl.h"

#define dotW 8
#define magrin 50

@interface customPageControl ()
@property(nonatomic ,strong) NSMutableDictionary *viewContainer;
@end
@implementation customPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
	if(self = [super initWithFrame:frame])
	{
		self.userInteractionEnabled = NO;
		self.viewContainer = [NSMutableDictionary dictionary];
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	//计算圆点间距
	CGFloat marginX = dotW + magrin;
	//计算整个pageControll的宽度
	CGFloat newW = (self.subviews.count - 1 ) * marginX + dotW;
	//设置新frame
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newW, self.frame.size.height);
	//设置居中
	CGPoint center = self.center;
	center.x = self.superview.center.x;
	self.center = center;
	//遍历subview,设置圆点frame
	for (int i=0; i<[self.subviews count]; i++) {
		UIImageView* dot = [self.subviews objectAtIndex:i];
		if (i == self.currentPage) {
			[dot setFrame:CGRectMake(i * marginX - dotW/2, dot.frame.origin.y, dotW*2, dotW)];
			
			dot.layer.cornerRadius = 4;
			dot.layer.masksToBounds = YES;
			
			CAShapeLayer *layer = self.viewContainer[@(i)];
			
			if (layer) {
				[layer removeFromSuperlayer];
				layer = nil;
			}
			
		}else {
			[dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, dotW, dotW)];
			
			CAShapeLayer *layer = self.viewContainer[@(i)];
			
			if (layer) {
				[layer removeFromSuperlayer];
				layer = nil;
			}
			
//			dot.backgroundColor = [UIColor clearColor];
			[self createRoundWithView:dot with:i];
		}
	}
}

/**
 创建空心圆
 */
- (void)createRoundWithView:(UIView *)view with:(int) index{
	UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
	CAShapeLayer *layer = [self createShapeLayerNoFrame:[UIColor clearColor]];
	layer.path = path.CGPath;
	layer.lineWidth = 2.0;
	//圆的起始位置，默认为0
	layer.strokeStart = 0;
	//圆的结束位置，默认为1，如果值为0.75，则显示3/4的圆
	layer.strokeEnd = 1;
	[view.layer addSublayer:layer];
	self.viewContainer[@(index)] = layer;
}

- (CAShapeLayer *)createShapeLayerNoFrame:(UIColor *)color{
	CAShapeLayer *layer = [CAShapeLayer layer];
	//线条瑟
	layer.strokeColor = [UIColor blackColor].CGColor;
	layer.fillColor = color.CGColor;
	return layer;
}
@end
