//
//  WaterLayout.h
//  WaterFlowDemo
//
//  Created by 优聚投 on 16/7/12.
//  Copyright © 2016年 More. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaterLayout;

@protocol WaterLayoutDelegate <NSObject>

- (CGFloat)waterflowLayout:(WaterLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@end
@interface WaterLayout : UICollectionViewLayout
@property(nonatomic,weak)id<WaterLayoutDelegate>delegate;


@end
