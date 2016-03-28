//
//  MyCard.m
//  model-cr
//
//  Created by qswdzy on 16/3/21.
//  Copyright © 2016年 qswdzy. All rights reserved.
//

#import "MyCard.h"

@implementation MyCard
+ (instancetype)cardWithDict:(NSDictionary *)dict
{
    MyCard *card = [[MyCard alloc] init];
    [card setValuesForKeysWithDictionary:dict];
    return card;
}
@end
