//
//  MyCardGroup.m
//  model-cr
//
//  Created by qswdzy on 16/3/21.
//  Copyright © 2016年 qswdzy. All rights reserved.
//

#import "MyCardGroup.h"
#import "MyCard.h"

@implementation MyCardGroup
+ (instancetype)cardGroupWithDict:(NSDictionary *)dict
{
    MyCardGroup *cg = [[self alloc] init];
    cg.title = dict[@"title"];
    
    NSMutableArray *cards = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cards"]) {
        MyCard *card = [MyCard cardWithDict:carDict];
        [cards addObject:card];
    }
    cg.cards = cards;
    return cg;
}
@end
