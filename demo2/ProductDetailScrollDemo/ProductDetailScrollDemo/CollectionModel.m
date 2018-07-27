//
//  CollectionModel.m
//  DetailProdctPageDemo
//
//  Created by MacOS on 2018/7/10.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "CollectionModel.h"

@implementation CollectionModel
-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    if (self) {
        
        self.name = [NSString stringWithFormat:@"%@",dictionary[@"name"]];
        self.raw_price = [NSString stringWithFormat:@"%@",dictionary[@"raw_price"]];
        self.zk_price = [NSString stringWithFormat:@"%@",dictionary[@"zk_price"]];
        self.month_sales = [NSString stringWithFormat:@"%@",dictionary[@"month_sales"]];
        self.pic = [NSString stringWithFormat:@"%@",dictionary[@"pic"]];
        self.pdescription = [NSString stringWithFormat:@"%@",dictionary[@"pdescription"]];
        self.detail_url = [NSString stringWithFormat:@"%@",dictionary[@"detail_url"]];
        
    }
    return self;
}
+(instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    
    return [[self alloc] initWithDictionary:dictionary];
}
@end
