//
//  QSUppgradeViewController.m
//  CR-TR
//
//  Created by qswdzy on 16/3/21.
//  Copyright © 2016年 qswdzy. All rights reserved.
//

#import "QSUppgradeViewController.h"

@implementation QSUppgradeViewController
- (NSArray *)imageList
{
    
    if (_imageList == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ImageList" ofType:@"plist"];
        NSLog(@"%@", path);
        
        _imageList = [NSArray arrayWithContentsOfFile:path];
        
    }
    return _imageList;
}

#pragma mark - 控件的懒加载

- (UILabel *)noLabel
{
    if (_noLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, 40)];
        
        _noLabel = label;
        _noLabel.textColor = [UIColor redColor];
        
        _noLabel.textAlignment  = NSTextAlignmentCenter;
        [self.view addSubview:_noLabel];
    }
    return _noLabel;
}

- (UIImageView *)iconImage
{
    if (_iconImage == nil) {
        CGFloat imageW = 300;
        CGFloat imageH = 450;
        CGFloat imageX = (self.view.bounds.size.width - imageW) * 0.5;
        CGFloat imageY = CGRectGetMaxY(self.noLabel.frame) + 20;
        
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
        [self.view addSubview:_iconImage];
    }
    return _iconImage;
}

- (UILabel *)descLabel
{
    if (_descLabel == nil) {
        CGFloat descY = CGRectGetMaxY(self.iconImage.frame);
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, descY, self.view.bounds.size.width, 100)];
        _descLabel.textAlignment = NSTextAlignmentCenter;
        
        _descLabel.textColor = [UIColor redColor];
        _descLabel.numberOfLines = 0;
        [self.view addSubview:_descLabel];
    }
    return _descLabel;
}

- (UIButton *)leftButton
{
    if (_leftButton == nil) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        CGFloat centerY = self.iconImage.center.y;
        CGFloat centerX = self.iconImage.frame.origin.x * 0.5;
        _leftButton.center = CGPointMake(centerX, centerY);
        
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
        [self.view addSubview:_leftButton];
        
        _leftButton.tag = -1;
        
        [_leftButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UIButton *)rightButton
{
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        CGFloat centerY = self.iconImage.center.y;
        CGFloat centerX = self.iconImage.frame.origin.x * 0.5;
        _rightButton.center = CGPointMake(self.view.bounds.size.width - centerX, centerY);
        
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
        [self.view addSubview:_rightButton];
        
        _rightButton.tag = 1;
        
        [_rightButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    [self.view addSubview:self.noLabel];
    
    
    // 显示照片信息
    [self showPhotoInfo];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

/**
 重构的目的：让相同的代码只出现一次
 */
- (void)showPhotoInfo
{
    // 设置序号
    self.noLabel.text = self.imageList[self.index][@"category"];
    
    self.iconImage.image = [UIImage imageNamed:self.imageList[self.index][@"name"]];
    self.descLabel.text =self.imageList[self.index][@"desc"];
    
    
    self.rightButton.enabled = (self.index != 3);
    self.leftButton.enabled = (self.index != 0);
}


- (void)clickButton:(UIButton *)button
{
    
    self.index += button.tag;
    
    [self showPhotoInfo];
}


@end
