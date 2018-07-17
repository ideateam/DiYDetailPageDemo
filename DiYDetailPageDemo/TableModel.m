//
//  TableModel.m
//  DetailProdctPageDemo
//
//  Created by MacOS on 2018/7/10.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "TableModel.h"

@implementation TableModel
-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    if (self) {
        
        self.productImageUrl = [NSString stringWithFormat:@"%@",dictionary[@"detailImageArr"]];
        NSLog(@"%lu",(unsigned long)self.productImageUrl.length);
    }
    return self;
}
+(instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    
    return [[self alloc] initWithDictionary:dictionary];
}
@end
