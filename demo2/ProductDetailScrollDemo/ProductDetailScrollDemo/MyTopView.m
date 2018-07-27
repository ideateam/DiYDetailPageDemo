//
//  MyTopView.m
//  DiYDetailPageDemo
//
//  Created by MacOS on 2018/7/17.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "MyTopView.h"

#define SCW [UIScreen mainScreen].bounds.size.width
#define SCH [UIScreen mainScreen].bounds.size.height

@implementation MyTopView
-(instancetype)initWithBannerArray:(NSArray *)BannerArray{
    
    self = [super init];
    
    if (self) {
        
        [self setUI];
        self.cycleBannerArr = [NSArray arrayWithArray:BannerArray];;
    }
    return self;
}
-(void)setUI{
    
    [self addSubview:self.cycleScrollView];
    
    [self addSubview:self.productNameLabel];
    [self addSubview:self.productPriceLabel];
    [self addSubview:self.discountCouponLabel];
    [self addSubview:self.discountCouponPriceLabel];
    [self addSubview:self.freeShipOrNotLabel];
    [self addSubview:self.salesNumLabel];
    
    [self addSubview:self.discountCouponBaseView];
    [self addSubview:self.discountCouponNumLabel];
    [self addSubview:self.discountTimeLabel];
    
    [self addSubview:self.lineLable];
    [self addSubview:self.lineLable2];
    [self addSubview:self.lineLable3];
    
    [self addSubview:self.shopIcon];
    [self addSubview:self.shopNameLabel];
    [self addSubview:self.shopStarLabel];
    [self addSubview:self.shopJumpDetailDiscountCouponLabel];
    [self addSubview:self.shopDescriptionStarNumLabel];
    [self addSubview:self.shopSalesSeriveStarNumLabel];
    [self addSubview:self.shopLogisticsSeriveStarNumLabel];
    
    [self addSubview:self.similarProductTitle];
    [self addSubview:self.similarProductScrollView];
    
    
    self.cycleScrollView.sd_layout.topSpaceToView(self, 0).leftSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(450);
    self.productNameLabel.sd_layout.topSpaceToView(self.cycleScrollView, 10).rightSpaceToView(self, 20).leftSpaceToView(self, 20).heightIs(20);
    self.productPriceLabel.sd_layout.topSpaceToView(self.productNameLabel, 10).rightSpaceToView(self, 20).leftSpaceToView(self, 20).heightIs(20);
    self.discountCouponLabel.sd_layout.topSpaceToView(self.productPriceLabel, 10).leftSpaceToView(self, 20).widthIs(60).heightIs(40);
    self.discountCouponPriceLabel.sd_layout.topSpaceToView(self.productPriceLabel, 10).leftSpaceToView(self.discountCouponLabel, 20).heightIs(40).widthIs(120);
    self.salesNumLabel.sd_layout.topSpaceToView(self.productPriceLabel, 10).rightSpaceToView(self, 20).heightIs(40).widthIs(100);
    self.freeShipOrNotLabel.sd_layout.topSpaceToView(self.productPriceLabel, 10).rightSpaceToView(self.salesNumLabel, 20).heightIs(40).widthIs(60);
    
    self.discountCouponBaseView.sd_layout.topSpaceToView(self.discountCouponPriceLabel, 15).leftSpaceToView(self, 20).rightSpaceToView(self, 20).heightIs(90);
    
    self.lineLable.sd_layout.topSpaceToView(self.discountCouponBaseView, 30).leftSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(10);
    
    self.shopIcon.sd_layout.topSpaceToView(self.lineLable, 30).leftSpaceToView(self, 20).widthIs(80).heightIs(80);
    self.shopNameLabel.sd_layout.topSpaceToView(self.lineLable, 30).leftSpaceToView(self.shopIcon, 10).widthIs(120).heightIs(20);
    self.shopStarLabel.sd_layout.topSpaceToView(self.shopNameLabel, 10).leftSpaceToView(self.shopIcon, 10).widthIs(120).heightIs(20);
    self.shopJumpDetailDiscountCouponLabel.sd_layout.topSpaceToView(self.lineLable, 30).rightSpaceToView(self, 20).widthIs(120).heightIs(20);
    
    self.shopDescriptionStarNumLabel.sd_layout.topSpaceToView(self.shopIcon, 25).leftSpaceToView(self, 20).heightIs(30).widthIs((SCW - 40)/3);
    self.shopSalesSeriveStarNumLabel.sd_layout.topSpaceToView(self.shopIcon, 25).leftSpaceToView(self.shopDescriptionStarNumLabel, 0).heightIs(30).widthIs((SCW - 40)/3);
    self.shopLogisticsSeriveStarNumLabel.sd_layout.topSpaceToView(self.shopIcon, 25).leftSpaceToView(self.shopSalesSeriveStarNumLabel, 0).heightIs(30).widthIs((SCW - 40)/3);
    
    self.lineLable2.sd_layout.topSpaceToView(self.shopDescriptionStarNumLabel, 20).leftSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(10);
    
    self.similarProductTitle.sd_layout.topSpaceToView(self.lineLable2, 10).centerXIs(SCW/2).widthIs(120).heightIs(20);
    
    self.similarProductScrollView.sd_layout.topSpaceToView(self.lineLable2, 30).leftSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(130);
    
    for (int i = 0; i < 6; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 + i * 10 + i * 120, 5, 120,120)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://img.alicdn.com/imgextra/i2/75160289/TB2qMpYaxuTBuNkHFNRXXc9qpXa_!!75160289.jpg_400x400"]];
        [self.similarProductScrollView addSubview:imageView];
    }
    
    self.lineLable3.sd_layout.topSpaceToView(self.similarProductScrollView, 20).leftSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(10);
}
-(SDCycleScrollView *)cycleScrollView{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCW, 450) delegate:self placeholderImage:[UIImage imageNamed:@"1"]];
        _cycleScrollView.backgroundColor = [UIColor redColor];
        _cycleScrollView.autoScroll = NO;
        //cycleScrollView.imageURLStringsGroup = self.topHeadBannerArray;
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        //cycleScrollView.titlesGroup = titles;
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        __weak __typeof__(self) weakSelf = self;
        //         --- 模拟加载延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.cycleScrollView.imageURLStringsGroup = weakSelf.cycleBannerArr;
        });
    }
    return _cycleScrollView;
}
//产品详细
-(UILabel *)productNameLabel{
    if (!_productNameLabel) {
        _productNameLabel = [[UILabel alloc] init];
        if (@available(iOS 8.2, *)) {
            _productNameLabel.font = [UIFont systemFontOfSize:15 weight:20];
        } else {
            // Fallback on earlier versions
        }
        _productNameLabel.text = @"韩版潮流假两件五分袖T恤";
        //_productNameLabel.backgroundColor = [UIColor orangeColor];
    }
    return _productNameLabel;
}
-(UILabel *)productPriceLabel{
    if (!_productPriceLabel) {
        _productPriceLabel = [[UILabel alloc] init];
        _productPriceLabel.text = @"原价  ¥55";
        _productPriceLabel.textColor = [UIColor lightGrayColor];
        _productPriceLabel.font = [UIFont systemFontOfSize:13];
        //_productPriceLabel.backgroundColor = [UIColor orangeColor];
    }
    return _productPriceLabel;
}
-(UILabel *)discountCouponLabel{
    if (!_discountCouponLabel) {
        _discountCouponLabel = [[UILabel alloc] init];
        _discountCouponLabel.text = @"券后价 ";
        _discountCouponLabel.textColor = [UIColor redColor];
        _discountCouponLabel.font = [UIFont systemFontOfSize:13];
        //_discountCouponPriceLabel.backgroundColor = [UIColor orangeColor];
    }
    return _discountCouponLabel;
}
-(UILabel *)discountCouponPriceLabel{
    if (!_discountCouponPriceLabel) {
        _discountCouponPriceLabel = [[UILabel alloc] init];
        _discountCouponPriceLabel.text = @"¥52";
        _discountCouponPriceLabel.textColor = [UIColor redColor];
        _discountCouponPriceLabel.font = [UIFont systemFontOfSize:18];
        //_discountCouponPriceLabel.backgroundColor = [UIColor orangeColor];
    }
    return _discountCouponPriceLabel;
}
-(UILabel *)freeShipOrNotLabel{
    if (!_freeShipOrNotLabel) {
        _freeShipOrNotLabel = [[UILabel alloc] init];
        _freeShipOrNotLabel.text = @"包邮";
        _freeShipOrNotLabel.textColor = [UIColor lightGrayColor];
        _freeShipOrNotLabel.font = [UIFont systemFontOfSize:13];
        //_freeShipOrNotLabel.backgroundColor = [UIColor orangeColor];
    }
    return _freeShipOrNotLabel;
}
-(UILabel *)salesNumLabel{
    if (!_salesNumLabel) {
        _salesNumLabel = [[UILabel alloc] init];
        _salesNumLabel.text = @"月销 13123";
        _salesNumLabel.textAlignment = NSTextAlignmentRight;
        _salesNumLabel.textColor = [UIColor lightGrayColor];
        _salesNumLabel.font = [UIFont systemFontOfSize:13];
        //_salesNumLabel.backgroundColor = [UIColor orangeColor];
    }
    return _salesNumLabel;
}

////优惠券
-(UIImageView *)discountCouponBaseView{
    if (!_discountCouponBaseView) {
        _discountCouponBaseView = [[UIImageView alloc] init];
        _discountCouponBaseView.image = [UIImage imageNamed:@"discount"];
        //_discountCouponBaseView.backgroundColor = [UIColor redColor];
    }
    return _discountCouponBaseView;
}
-(UILabel *)discountCouponNumLabel{
    if (!_discountCouponNumLabel) {
        _discountCouponNumLabel = [[UILabel alloc] init];
        _discountCouponNumLabel.backgroundColor = [UIColor orangeColor];
    }
    return _discountCouponNumLabel;
}
-(UILabel *)discountTimeLabel{
    if (!_discountTimeLabel) {
        _discountTimeLabel = [[UILabel alloc] init];
        _discountTimeLabel.backgroundColor = [UIColor orangeColor];
    }
    return _discountTimeLabel;
}
//
-(UILabel *)lineLable{
    if (!_lineLable) {
        _lineLable = [[UILabel alloc] init];
        _lineLable.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0  blue:238/255.0  alpha:1];
    }
    return _lineLable;
}
-(UILabel *)lineLable2{
    if (!_lineLable2) {
        _lineLable2 = [[UILabel alloc] init];
        _lineLable2.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0  blue:238/255.0  alpha:1];
    }
    return _lineLable2;
}
-(UILabel *)lineLable3{
    if (!_lineLable3) {
        _lineLable3 = [[UILabel alloc] init];
        _lineLable3.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0  blue:238/255.0  alpha:1];
    }
    return _lineLable3;
}
//店铺
-(UIImageView *)shopIcon{
    if (!_shopIcon) {
        _shopIcon = [[UIImageView alloc] init];
        _shopIcon.backgroundColor = [UIColor orangeColor];
        [_shopIcon sd_setImageWithURL:[NSURL URLWithString:@"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1894992214,3473101703&fm=58&s=9095187A4F45B20B49AA4BB70300C02D&bpow=121&bpoh=75"]];
    }
    return _shopIcon;
}
-(UILabel *)shopNameLabel{
    if (!_shopNameLabel) {
        _shopNameLabel = [[UILabel alloc] init];
        _shopNameLabel.text = @"独儿怪旗舰店";
        _shopNameLabel.font = [UIFont systemFontOfSize:15];
    }
    return _shopNameLabel;
}
-(UILabel *)shopStarLabel{
    if (!_shopStarLabel) {
        _shopStarLabel = [[UILabel alloc] init];
        _shopStarLabel.font = [UIFont systemFontOfSize:14];
        _shopStarLabel.text = @"💎💎💎💎💎";
    }
    return _shopStarLabel;
}
-(UILabel *)shopJumpDetailDiscountCouponLabel{
    if (!_shopJumpDetailDiscountCouponLabel) {
        _shopJumpDetailDiscountCouponLabel = [[UILabel alloc] init];
        _shopJumpDetailDiscountCouponLabel.font = [UIFont systemFontOfSize:12];
        _shopJumpDetailDiscountCouponLabel.text = @"查看店铺所有优惠 >";
    }
    return _shopJumpDetailDiscountCouponLabel;
}
-(UILabel *)shopDescriptionStarNumLabel{
    if (!_shopDescriptionStarNumLabel) {
        _shopDescriptionStarNumLabel = [[UILabel alloc] init];
        _shopDescriptionStarNumLabel.text = @"宝贝描述： 4.8";
        _shopDescriptionStarNumLabel.textAlignment = NSTextAlignmentCenter;
        _shopDescriptionStarNumLabel.font = [UIFont systemFontOfSize:12];
        //_shopDescriptionStarNumLabel.backgroundColor = [UIColor yellowColor];
    }
    return _shopDescriptionStarNumLabel;
}
-(UILabel *)shopSalesSeriveStarNumLabel{
    if (!_shopSalesSeriveStarNumLabel) {
        _shopSalesSeriveStarNumLabel = [[UILabel alloc] init];
        _shopSalesSeriveStarNumLabel.text = @"卖家服务： 4.7";
        _shopSalesSeriveStarNumLabel.textAlignment = NSTextAlignmentCenter;
        _shopSalesSeriveStarNumLabel.font = [UIFont systemFontOfSize:12];
        //_shopSalesSeriveStarNumLabel.backgroundColor = [UIColor blueColor];
    }
    return _shopSalesSeriveStarNumLabel;
}
-(UILabel *)shopLogisticsSeriveStarNumLabel{
    if (!_shopLogisticsSeriveStarNumLabel) {
        _shopLogisticsSeriveStarNumLabel = [[UILabel alloc] init];
        _shopLogisticsSeriveStarNumLabel.text = @"物流服务： 4.7";
        _shopLogisticsSeriveStarNumLabel.textAlignment = NSTextAlignmentCenter;
        _shopLogisticsSeriveStarNumLabel.font = [UIFont systemFontOfSize:12];
        //_shopLogisticsSeriveStarNumLabel.backgroundColor = [UIColor orangeColor];
    }
    return _shopLogisticsSeriveStarNumLabel;
}
-(UILabel *)similarProductTitle{
    if (!_similarProductTitle) {
        _similarProductTitle = [[UILabel alloc] init];
        _similarProductTitle.text = @"相似推荐";
        _similarProductTitle.textAlignment = NSTextAlignmentCenter;
        _similarProductTitle.font = [UIFont systemFontOfSize:13];
        //_shopLogisticsSeriveStarNumLabel.backgroundColor = [UIColor orangeColor];
    }
    return _similarProductTitle;
}
//similarProductScrollView
-(UIScrollView *)similarProductScrollView{
    if (!_similarProductScrollView) {
        _similarProductScrollView = [[UIScrollView alloc] init];
        //_similarProductScrollView.backgroundColor = [UIColor orangeColor];
        _similarProductScrollView.contentSize = CGSizeMake(SCW * 2, 0);
    }
    return _similarProductScrollView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
