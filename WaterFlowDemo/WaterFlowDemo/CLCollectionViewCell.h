//
//  CLCollectionViewCell.h
//  WaterFlowDemo
//
//  Created by 优聚投 on 16/7/12.
//  Copyright © 2016年 More. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CLModel.h"
@interface CLCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)CLModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
