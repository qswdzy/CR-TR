//
//  MyCardGroup.h
//  model-cr
//
//  Created by qswdzy on 16/3/21.
//  Copyright © 2016年 qswdzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCardGroup : NSObject
@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *cards;

+ (instancetype)cardGroupWithDict:(NSDictionary *)dict;
@end
