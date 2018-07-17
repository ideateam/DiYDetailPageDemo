//
//  CollectionModel.h
//  DetailProdctPageDemo
//
//  Created by MacOS on 2018/7/10.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *raw_price;
@property (nonatomic,copy) NSString *zk_price;
@property (nonatomic,copy) NSString *month_sales;
@property (nonatomic,copy) NSString *pic;
@property (nonatomic,copy) NSString *pdescription;
@property (nonatomic,copy) NSString *detail_url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
+(instancetype)modelWithDictionary:(NSDictionary *)dictionary;
@end
