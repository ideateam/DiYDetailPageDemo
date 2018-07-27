//
//  MyTableViewCell.m
//  DetailProdctPageDemo
//
//  Created by MacOS on 2018/7/10.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
    
    [self.contentView addSubview:self.productImageView];
    self.productImageView.sd_layout.topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);
}
-(UIImageView *)productImageView{
    if (!_productImageView) {
        _productImageView = [[UIImageView alloc] init];
        _productImageView.backgroundColor = [UIColor redColor];
        //_productImageView.contentMode = UIViewContentModeScaleToFill;
        //_productImageView.clipsToBounds = YES;
        
    }
    return _productImageView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
