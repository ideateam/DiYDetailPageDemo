//
//  SquareUpFBC.m
//  Squared_Up_fei
//
//  Created by Karl on 2018/6/27.
//  Copyright © 2018 Derek. All rights reserved.
//

#import "SquareUpFBC.h"

#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_heght [UIScreen mainScreen].bounds.size.height

@implementation SquareUpFBC

//------------- 方式 1----------------

-(instancetype)initWithBaseFrame:(CGRect)frame andNum_of_squareness:(int)num_of_squareness andNum_of_squareness_horizontal:(int)num_of_squareness_horizontal andSquareness_width:(double)squareness_width andSquareness_height:(double)squareness_height andSquareness_padding_to_top:(double)squareness_padding_to_top andSquareness_padding_to_left:(double)squareness_padding_to_left andSquareness_padding_to_right:(double)squareness_padding_to_right andSquareness_avage_distence_horizental:(double)squareness_avage_distence_horizental andSquareness_avage_distence_vertical:(double)squareness_avage_distence_vertical{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.userInteractionEnabled = YES;
        _baseframe = frame;
        _num_of_squareness = num_of_squareness;
        _num_of_squareness_horizontal = num_of_squareness_horizontal;
        _squareness_width = squareness_width;
        _squareness_height = squareness_height;
        _squareness_padding_to_top = squareness_padding_to_top;
        _squareness_padding_to_left = squareness_padding_to_left;
        _squareness_padding_to_right = squareness_padding_to_right;
        _squareness_avage_distence_vertical = squareness_avage_distence_vertical;
        _squareness_avage_distence_horizental = (_baseframe.size.width - squareness_padding_to_left - squareness_padding_to_right - num_of_squareness_horizontal * squareness_width)/(_num_of_squareness_horizontal - 1);
        
        
        [self createSquareUpView];
    }
    
    return self;
}
-(void)createSquareUpView{
    
    _k_num=0;
    
    //开始循环自动绘制九宫格，外层默认循环100次，总的格子个数为 （100 * _num_of_squareness_horizontal），具体按照数量可自己增加
    for (int i = 0; i < 100; i++) {
        
        for (int j = 0; j < _num_of_squareness_horizontal; j++) {
            
            if (_k_num == _num_of_squareness) {
                //NSLog(@"break k_um=%d",_k_num);
                break;//达到设定的数量就停止追加格子
            }
            //生成格子,默认格子是UIview，你可以根据需要改成UIbutton或者UIimageview等都可以
            self.squareness_view = [[UIView alloc] initWithFrame: CGRectMake(_squareness_padding_to_left + _squareness_avage_distence_horizental * ( j ) + ( j ) * _squareness_width, i == 0 ? _squareness_padding_to_top : (_squareness_height * i + i * _squareness_avage_distence_vertical + _squareness_padding_to_top), _squareness_width, _squareness_height)];
            _squareness_view.userInteractionEnabled = YES;
            _squareness_view.tag = 10000 + _k_num ;// 0 到 （_k_num - 1）
            _squareness_view.backgroundColor=[UIColor redColor];
            //添加点击手势
            UITapGestureRecognizer *tapThisView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapThisView:)];
            [_squareness_view addGestureRecognizer:tapThisView];
            //添加到父视图
            [self addSubview:_squareness_view];
            
            _k_num=_k_num + 1;//计算数量
             //NSLog(@"count k_um=%d  %ld",_k_num,_squareness_view.tag);
        }
    }
}
-(void)tapThisView:(UITapGestureRecognizer *)tapGestureRecognizer{
    
    //NSLog(@"tapThisView = %ld",tapGestureRecognizer.view.tag);
    
    if ([_delegate respondsToSelector:@selector(whichViewIsTap:)]) {
        [_delegate whichViewIsTap:tapGestureRecognizer];
    }
}

//------------- 方式 2----------------

//水平方向平均间隔，包括距离左侧、右侧、格子之间的距离都是一样的。不可定义格子的宽（自动调节宽），可自由定义距离最上面的距离
-(instancetype)initWithBaseFrame2:(CGRect)frame andNum_of_squareness:(int)num_of_squareness andNum_of_squareness_horizontal:(int)num_of_squareness_horizontal andSquareness_width:(double)squareness_width andSquareness_height:(double)squareness_height andSquareness_padding_to_top:(double)squareness_padding_to_top andSquareness_avage_distence_horizental:(double)squareness_avage_distence_horizental andSquareness_avage_distence_vertical:(double)squareness_avage_distence_vertical{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.userInteractionEnabled = YES;
        _baseframe = frame;
        _num_of_squareness = num_of_squareness;
        _num_of_squareness_horizontal = num_of_squareness_horizontal;
        _squareness_width = ((_baseframe.size.width - squareness_avage_distence_horizental * (num_of_squareness_horizontal + 1)) / _num_of_squareness_horizontal );
        _squareness_height = squareness_height;
        _squareness_padding_to_top = squareness_padding_to_top;
        _squareness_avage_distence_vertical = squareness_avage_distence_vertical;
        _squareness_avage_distence_horizental = squareness_avage_distence_horizental;
        
        NSLog(@"_squareness_width = %lf  _squareness_avage_distence_horizental = %lf",_squareness_width,_squareness_avage_distence_horizental);
        
        [self createSquareUpView2];
    }
    
    return self;
    
}
-(void)createSquareUpView2{
    
    _k_num=0;
    
    //开始循环自动绘制九宫格，外层默认循环100次，总的格子个数为 （100 * _num_of_squareness_horizontal），具体按照数量可自己增加
    for (int i = 0; i < 100; i++) {
        
        for (int j = 0; j < _num_of_squareness_horizontal; j++) {
            
            if (_k_num == _num_of_squareness) {
                //NSLog(@"break k_um=%d",_k_num);
                break;//达到设定的数量就停止追加格子
            }
            //生成格子,默认格子是UIview，你可以根据需要改成UIbutton或者UIimageview等都可以
            self.squareness_view = [[UIView alloc] initWithFrame: CGRectMake(_squareness_avage_distence_horizental * ( j + 1 ) + ( j ) * _squareness_width, i == 0 ? _squareness_padding_to_top : (_squareness_height * i + i * _squareness_avage_distence_vertical + _squareness_padding_to_top), _squareness_width, _squareness_height)];
            _squareness_view.userInteractionEnabled = YES;
            _squareness_view.tag = 10000 + _k_num ;// 0 到 （_k_num - 1）
            _squareness_view.backgroundColor=[UIColor redColor];
            //添加点击手势
            UITapGestureRecognizer *tapThisView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapThisView:)];
            [_squareness_view addGestureRecognizer:tapThisView];
            //添加到父视图
            [self addSubview:_squareness_view];
            
            _k_num=_k_num + 1;//计算数量
            //NSLog(@"count k_um=%d  %ld",_k_num,_squareness_view.tag);
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
