//
//  SquareUpFBC.h
//  Squared_Up_fei
//
//  Created by Derek on 2018/6/27.
//  Copyright © 2018 Derek. All rights reserved.
//九宫格封装

#import <UIKit/UIKit.h>

@protocol  SquareUpFBCdelegate<NSObject>
-(void)whichViewIsTap:(UITapGestureRecognizer *)tapGestureRecognizer;
@end

@interface SquareUpFBC : UIView

@property (nonatomic,assign) CGRect baseframe;//容器的布局
@property (nonatomic,assign) int num_of_squareness;//九宫格的矩形数量，多少个
@property (nonatomic,assign) int num_of_squareness_horizontal; //每一行数量
@property (nonatomic,assign) double squareness_width;//矩形宽
@property (nonatomic,assign) double squareness_height;//矩形高
@property (nonatomic,assign) double squareness_padding_to_top;//矩形距离上方的距离
@property (nonatomic,assign) double squareness_padding_to_left;//矩形距离最左侧的距离
@property (nonatomic,assign) double squareness_padding_to_right;//矩形距离右侧的距离
@property (nonatomic,assign) double squareness_avage_distence_horizental;//水平方向每一个的平均距离
@property (nonatomic,assign) double squareness_avage_distence_vertical;//垂直方向的每一个的平均距离
@property (nonatomic,strong) UIView *squareness_view;//矩形视图,每一个格子

//统计各自的数量
@property (nonatomic,assign) int k_num;
@property (nonatomic,strong) id <SquareUpFBCdelegate> delegate;

@property (nonatomic,strong) NSArray *imageArray;

/*
 *@parameter 参数
 
 *  num_of_squareness;//九宫格的矩形数量，多少个
 *  num_of_squareness_horizontal; //每一行数量
 *  squareness_width;//矩形宽
 *  squareness_height;//矩形高
 *  squareness_padding_to_top;//矩形距离上方的距离
 *  squareness_padding_to_bottom;//矩形距离下方的距离
 *  squareness_avage_distence_horizental;//水平方向每一个的平均距离
 *  squareness_avage_distence_vertical;//垂直方向的每一个的平均距离
 *
 */
//可自由定义距离左侧的距离，可自由定义右侧的距离，可自由定义格子的宽、高，可自由定义距离最上面的距离
-(instancetype)initWithBaseFrame:(CGRect)frame andNum_of_squareness:(int)num_of_squareness andNum_of_squareness_horizontal:(int)num_of_squareness_horizontal andSquareness_width:(double)squareness_width andSquareness_height:(double)squareness_height andSquareness_padding_to_top:(double)squareness_padding_to_top andSquareness_padding_to_left:(double)squareness_padding_to_left andSquareness_padding_to_right:(double)squareness_padding_to_right andSquareness_avage_distence_horizental:(double)squareness_avage_distence_horizental andSquareness_avage_distence_vertical:(double)squareness_avage_distence_vertical;

//水平方向平均间隔，包括距离左侧、右侧、格子之间的距离都是一样的。不可定义格子的宽（自动调节宽），可自由定义距离最上面的距离
-(instancetype)initWithBaseFrame2:(CGRect)frame andNum_of_squareness:(int)num_of_squareness andNum_of_squareness_horizontal:(int)num_of_squareness_horizontal andSquareness_height:(double)squareness_height andSquareness_padding_to_top:(double)squareness_padding_to_top andSquareness_avage_distence_horizental:(double)squareness_avage_distence_horizental andSquareness_avage_distence_vertical:(double)squareness_avage_distence_vertical andImageArray:(NSArray *)imageArray;

@end
