//
//  MyTableViewCell.h
//  DetailProdctPageDemo
//
//  Created by MacOS on 2018/7/10.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDAutoLayout.h"
#import "UIImageView+WebCache.h"
#import "TableModel.h"

@interface MyTableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView *productImageView;
@property (nonatomic,strong) TableModel *model;

@end
