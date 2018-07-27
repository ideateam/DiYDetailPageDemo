//
//  MyBottomView.h
//  DiYDetailPageDemo
//
//  Created by MacOS on 2018/7/27.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SquareUpFBC.h"

@interface MyBottomView : UIView<SquareUpFBCdelegate>

@property (nonatomic,strong) NSArray *imageArray;

-(instancetype)initWithArray:(NSArray *)arr;
@end
