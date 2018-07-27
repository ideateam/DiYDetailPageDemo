//
//  TableModel.m
//  DetailProdctPageDemo
//
//  Created by MacOS on 2018/7/10.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "TableModel.h"

@implementation TableModel
-(instancetype)initWithUrlStr:(NSString *)urlstr{
    
    self = [super init];
    if (self) {
        
        self.productImageUrl = [NSString stringWithFormat:@"%@",urlstr];
        //NSLog(@"%lu",(unsigned long)self.productImageUrl.length);
    }
    return self;
}
+(instancetype)modelWithUrlStr:(NSString *)urlstr{
    
    return [[self alloc] initWithUrlStr:urlstr];
}
@end
