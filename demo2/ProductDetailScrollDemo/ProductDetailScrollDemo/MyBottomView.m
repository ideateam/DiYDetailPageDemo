//
//  MyBottomView.m
//  DiYDetailPageDemo
//
//  Created by MacOS on 2018/7/27.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "MyBottomView.h"

#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_heght [UIScreen mainScreen].bounds.size.height

@implementation MyBottomView

-(instancetype)initWithArray:(NSArray *)arr{
    
    self = [super init];
    if (self) {
        self.imageArray = [NSArray arrayWithArray:arr];
        [self setUI];
    }
    return self;
}
-(void)setUI{
    
    //SquareUpFBC *square = [[SquareUpFBC alloc] initWithBaseFrame:CGRectMake(0, 0, screen_width, 300) andNum_of_squareness:20 andNum_of_squareness_horizontal:4 andSquareness_width:60 andSquareness_height:60 andSquareness_padding_to_top:30 andSquareness_padding_to_left:10 andSquareness_padding_to_right:10 andSquareness_avage_distence_horizental:10 andSquareness_avage_distence_vertical:20];
    
    SquareUpFBC *square = [[SquareUpFBC alloc] initWithBaseFrame2:CGRectMake(0, 0, screen_width, 1535) andNum_of_squareness:10 andNum_of_squareness_horizontal:2 andSquareness_height:280 andSquareness_padding_to_top:10 andSquareness_avage_distence_horizental:5 andSquareness_avage_distence_vertical:5 andImageArray:_imageArray];
    
    square.delegate = self;
    square.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];;
    
    [self addSubview:square];
    
//    self.pic.sd_layout.topSpaceToView(self.contentView, 0).leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).widthIs(self.contentView.width).heightEqualToWidth();
//    self.name.sd_layout.topSpaceToView(self.pic, 5).leftSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 10).heightIs(40);
//    self.raw_price.sd_layout.topSpaceToView(self.name, 5).leftSpaceToView(self.contentView, 10).widthIs(60).heightIs(20);
//    self.month_sales.sd_layout.topSpaceToView(self.name, 5).rightSpaceToView(self.contentView, 10).heightIs(20).widthIs(80);
//    self.zk_price.sd_layout.topSpaceToView(self.raw_price, 5).leftSpaceToView(self.contentView, 10).widthIs(80).heightIs(20);
    
}
-(void)whichViewIsTap:(UITapGestureRecognizer *)tapGestureRecognizer{
    
    NSLog(@"whichViewIsTap %ld,第%ld个", tapGestureRecognizer.view.tag,tapGestureRecognizer.view.tag - 10000);
}
@end
