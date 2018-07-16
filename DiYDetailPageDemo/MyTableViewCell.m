//
//  MyTableViewCell.m
//  DiYDetailPageDemo
//
//  Created by MacOS on 2018/7/16.
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
    
    
    [self setLayout];
}
-(void)setModel:(MyModel *)model{
    
    
}
-(void)setLayout{
    
    
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
