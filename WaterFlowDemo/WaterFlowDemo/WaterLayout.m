//
//  WaterLayout.m
//  WaterFlowDemo
//
//  Created by 优聚投 on 16/7/12.
//  Copyright © 2016年 More. All rights reserved.
//

#import "WaterLayout.h"

static const NSInteger    DefaultColumnCount=3;// 行数
static const CGFloat      DefaultColumnMargin =10;
static const CGFloat      DefaultRowMargin =10;
static const UIEdgeInsets DefaultEdgeInsets={10,10,10,10};


@interface WaterLayout()

@property(nonatomic,strong)NSMutableArray *dataArray;


@property(nonatomic,strong)NSMutableArray*rowHeight;

@end

@implementation WaterLayout

-(NSMutableArray*)rowHeight{
    if (_rowHeight==nil) {
        _rowHeight=[[NSMutableArray alloc]init];
    }
    return _rowHeight;
}
-(NSMutableArray*)dataArray{
    
    if (_dataArray ==nil) {
        _dataArray =[[NSMutableArray alloc]init];
    }
    return _dataArray;
}



//初始化
-(void)prepareLayout
{
    [super prepareLayout];
    
    [self.rowHeight removeAllObjects];
    for (NSInteger i=0; i<DefaultColumnCount; i++) {
        [self.rowHeight addObject:@(DefaultEdgeInsets.top)];
    }
    
    [self.dataArray removeAllObjects];
    // 开始创建每一个cell对应的布局属性
    NSInteger count =[self.collectionView numberOfItemsInSection:0];
    for (NSInteger i=0; i<count; i++) {
        // 创建位置
        NSIndexPath *indexPath =[NSIndexPath indexPathForItem:i inSection:0];
        // 获取indexPath位置cell对应的布局属性
        UICollectionViewLayoutAttributes *attrs =[self layoutAttributesForItemAtIndexPath:indexPath];
        [self.dataArray addObject:attrs];
    }
}
-(BOOL)shouldGroupAccessibilityChildren
{
    return YES;
}
//确认cell
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect{
    
    return  self.dataArray;
    
}

//返回indexpath位置对应的cell
-(UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat collectionW =self.collectionView.frame.size.width;
    
    CGFloat w= (collectionW -DefaultEdgeInsets.left-DefaultEdgeInsets.right-(DefaultColumnCount-1)*DefaultColumnMargin)/DefaultColumnCount;
    
    CGFloat h =50+arc4random_uniform(100);
    
    //找出最短一列
    NSInteger Column =0;
    CGFloat minColumnH =[self.rowHeight[0]doubleValue];
    for (NSInteger i=0; i<DefaultColumnCount; i++) {
        CGFloat columnH =[self.rowHeight[i]doubleValue];
        if (minColumnH>columnH) {
            minColumnH =columnH;
            Column =i;
        }
    }
    CGFloat  x =DefaultEdgeInsets.left+Column*(w+DefaultColumnMargin);
    CGFloat y =minColumnH;
    if (y!=DefaultEdgeInsets.top) {
        y+=DefaultRowMargin;
    }
    attrs.frame =CGRectMake(x,y , w, h);
    self.rowHeight[Column]=@(CGRectGetMaxY(attrs.frame));
    
    return attrs;
    
}

-(CGSize)collectionViewContentSize{
    
    CGFloat maxColumH =[self.rowHeight[0]doubleValue];
    for (NSInteger i=1; i<DefaultColumnCount; i++) {
        CGFloat columnHeight = [self.rowHeight[i] doubleValue];
        
        if (maxColumH < columnHeight) {
            maxColumH = columnHeight;
        }
    }
    return CGSizeMake(0, maxColumH+DefaultEdgeInsets.bottom);
}

@end
