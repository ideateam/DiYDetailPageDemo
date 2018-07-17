//
//  MyCollectionViewCell.m
//  DetailProdctPageDemo
//
//  Created by MacOS on 2018/7/10.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setUI];
    }
    return self;
}
-(void)setUI{
    
    [self.contentView addSubview:self.pic];
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.raw_price];
    [self.contentView addSubview:self.zk_price];
    [self.contentView addSubview:self.month_sales];

    
    self.pic.sd_layout.topSpaceToView(self.contentView, 0).leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).widthIs(self.contentView.width).heightEqualToWidth();
    self.name.sd_layout.topSpaceToView(self.pic, 5).leftSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 10).heightIs(40);
    self.raw_price.sd_layout.topSpaceToView(self.name, 5).leftSpaceToView(self.contentView, 10).widthIs(60).heightIs(20);
    self.month_sales.sd_layout.topSpaceToView(self.name, 5).rightSpaceToView(self.contentView, 10).heightIs(20).widthIs(80);
    self.zk_price.sd_layout.topSpaceToView(self.raw_price, 5).leftSpaceToView(self.contentView, 10).widthIs(80).heightIs(20);
    
    //[self.contentView layoutSubviews];
    
}
-(void)setModel:(CollectionModel *)model{
    
    _model = model;
    
    _name.text = model.name;
    _raw_price.text = [NSString stringWithFormat:@"原价:%@",model.raw_price];
    _zk_price.text = [NSString stringWithFormat:@"券后：%@",model.zk_price];
    _month_sales.text = [NSString stringWithFormat:@"月销%@单",model.month_sales];
    _pdescription.text = model.pdescription;
    [_pic sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@"1"]];
    
}
-(UILabel *)name{
    if (!_name) {
        
        _name = [[UILabel alloc] init];
        //_name.backgroundColor = [UIColor blueColor];
        _name.numberOfLines = 2;
        _name.font = [UIFont systemFontOfSize:14];
    }
    return _name;
}
-(UILabel *)raw_price{
    if (!_raw_price) {
        
        _raw_price = [[UILabel alloc] init];
        //_raw_price.backgroundColor = [UIColor yellowColor];
        _raw_price.font = [UIFont systemFontOfSize:12];
        _raw_price.textColor = [UIColor lightGrayColor];
    }
    return _raw_price;
}
-(UILabel *)zk_price{
    if (!_zk_price) {
        
        _zk_price = [[UILabel alloc] init];
        //_zk_price.backgroundColor = [UIColor redColor];
        _zk_price.font = [UIFont systemFontOfSize:12];
        _zk_price.textColor = [UIColor redColor];
    }
    return _zk_price;
}
-(UILabel *)month_sales{
    if (!_month_sales) {
        
        _month_sales = [[UILabel alloc] init];
        //_month_sales.backgroundColor = [UIColor blueColor];
        _month_sales.font = [UIFont systemFontOfSize:12];
        _month_sales.textAlignment = NSTextAlignmentRight;
        _month_sales.textColor = [UIColor lightGrayColor];
    }
    return _month_sales;
}
-(UILabel *)pdescription{
    if (!_pdescription) {
        
        _pdescription = [[UILabel alloc] init];
        _pdescription.backgroundColor = [UIColor grayColor];
        _pdescription.textColor = [UIColor lightGrayColor];
    }
    return _pdescription;
}
-(UIImageView *)pic{
    if (!_pic) {
        
        _pic = [[UIImageView alloc] init];
        //_pic.backgroundColor = [UIColor orangeColor];
    }
    return _pic;
}
@end
