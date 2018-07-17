//
//  TableModel.h
//  DetailProdctPageDemo
//
//  Created by MacOS on 2018/7/10.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableModel : NSObject
@property (nonatomic,copy) NSString *productImageUrl;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
+(instancetype)modelWithDictionary:(NSDictionary *)dictionary;

@end
