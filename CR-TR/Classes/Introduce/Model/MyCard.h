//
//  MyCard.h
//  model-cr
//
//  Created by qswdzy on 16/3/21.
//  Copyright © 2016年 qswdzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCard : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
+ (instancetype)cardWithDict:(NSDictionary *)dict;
@end
