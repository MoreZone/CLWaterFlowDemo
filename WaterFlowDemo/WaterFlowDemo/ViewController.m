//
//  ViewController.m
//  WaterFlowDemo
//
//  Created by 优聚投 on 16/7/12.
//  Copyright © 2016年 More. All rights reserved.
//

#import "ViewController.h"
#import "WaterLayout.h"
#import "CLCollectionViewCell.h"
#import <MJExtension.h>

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource ,WaterLayoutDelegate>

/** 所有的商品数据 */
@property (nonatomic, strong) NSMutableArray *dataArray;

@end
static NSString *const cells= @"cell";

@implementation ViewController

-(NSMutableArray*)shops{
    
    if (_dataArray==nil) {
        _dataArray =[[NSMutableArray alloc]init];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    
    [self.dataArray removeAllObjects];
    
    [super viewDidLoad];

    [self makeUI];
    
}
-(void)makeUI{
    
    
    WaterLayout *layout =[[WaterLayout alloc]init];
    UICollectionView *collection =[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collection.delegate =self;
    collection.dataSource= self;
    [self.view addSubview:collection];
    
    [collection registerNib:[UINib nibWithNibName:NSStringFromClass([CLCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:cells];
    
    NSArray *shops = [CLModel mj_objectArrayWithFilename:@"1.plist"];
    
    [self.dataArray addObjectsFromArray:shops];
    
    
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CLCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:cells forIndexPath:indexPath];
    
    cell.model =self.dataArray[indexPath.row];
    
    return cell;
}
-(CGFloat)waterflowLayout:(WaterLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    
    CLModel *model =self.dataArray[index];
    return itemWidth * model.h/model.w;
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

@end
