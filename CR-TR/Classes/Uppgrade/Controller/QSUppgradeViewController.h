//
//  QSUppgradeViewController.h
//  CR-TR
//
//  Created by qswdzy on 16/3/21.
//  Copyright © 2016年 qswdzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSUppgradeViewController : UIViewController


@property (nonatomic, strong) UILabel *noLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

/** 当前照片索引 */
@property (nonatomic, assign) int index;
/** 图片信息的数组 */
@property (nonatomic, strong) NSArray *imageList;

@end
