//
//  MyTopView.h
//  DiYDetailPageDemo
//
//  Created by MacOS on 2018/7/17.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "SDAutoLayout.h"
#import "UIImageView+WebCache.h"

@interface MyTopView : UIView<SDCycleScrollViewDelegate>


//轮播图
@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic,strong) NSArray *cycleBannerArr;

//产品详细
@property (nonatomic,strong) UILabel *productNameLabel;
@property (nonatomic,strong) UILabel *productPriceLabel;
@property (nonatomic,strong) UILabel *discountCouponLabel;
@property (nonatomic,strong) UILabel *discountCouponPriceLabel;
@property (nonatomic,strong) UILabel *freeShipOrNotLabel;
@property (nonatomic,strong) UILabel *salesNumLabel;
//优惠券
@property (nonatomic,strong) UIImageView *discountCouponBaseView;
@property (nonatomic,strong) UILabel *discountCouponNumLabel;
@property (nonatomic,strong) UILabel *discountTimeLabel;

//分割线
@property (nonatomic,strong) UILabel *lineLable;
@property (nonatomic,strong) UILabel *lineLable2;
@property (nonatomic,strong) UILabel *lineLable3;
//店铺
@property (nonatomic,strong) UIImageView *shopIcon;
@property (nonatomic,strong) UILabel *shopNameLabel;
@property (nonatomic,strong) UILabel *shopStarLabel;
@property (nonatomic,strong) UILabel *shopJumpDetailDiscountCouponLabel;
@property (nonatomic,strong) UILabel *shopDescriptionStarNumLabel;
@property (nonatomic,strong) UILabel *shopSalesSeriveStarNumLabel;
@property (nonatomic,strong) UILabel *shopLogisticsSeriveStarNumLabel;

@property (nonatomic,strong) UILabel *similarProductTitle;
@property (nonatomic,strong) UIScrollView *similarProductScrollView;

-(instancetype)initWithBannerArray:(NSArray *)BannerArray;
@end
