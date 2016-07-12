//
//  CLCollectionViewCell.m
//  WaterFlowDemo
//
//  Created by 优聚投 on 16/7/12.
//  Copyright © 2016年 More. All rights reserved.
//

#import "CLCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@implementation CLCollectionViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
}
-(void)setModel:(CLModel *)model{
    _model =model;
    
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"loading"]];
    
    self.name.text = model.price;
    
    NSLog(@"%@",model.price);
}
@end
