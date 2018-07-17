//
//  MyCollectionViewCell.h
//  DetailProdctPageDemo
//
//  Created by MacOS on 2018/7/10.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionModel.h"
#import "UIImageView+WebCache.h"
#import "SDAutoLayout.h"

@interface MyCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *raw_price;
@property (nonatomic,strong) UILabel *zk_price;
@property (nonatomic,strong) UILabel *month_sales;
@property (nonatomic,strong) UIImageView *pic;
@property (nonatomic,strong) UILabel *pdescription;
@property (nonatomic,copy) NSString *detail_url;
@property (nonatomic,strong) CollectionModel *model;
@end
