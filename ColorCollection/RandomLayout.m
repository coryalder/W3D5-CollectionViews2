//
//  RandomLayout.m
//  ColorCollection
//
//  Created by Cory Alder on 2015-06-26.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "RandomLayout.h"


@interface RandomLayout ()

@property (nonatomic, strong) NSMutableArray *cellAttributes;

@end


@implementation RandomLayout


-(void)prepareLayout {
    
    
    self.cellAttributes = [NSMutableArray array];

    CGSize contentSize = [self collectionViewContentSize];
    
    NSUInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    
    
    
    for (int i = 0; i < cellCount; i++) {
        
        CGFloat randX = arc4random_uniform(contentSize.width);
        CGFloat randY = arc4random_uniform(contentSize.height);
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        attr.center = (CGPoint){randX, randY};
        
        attr.size = (CGSize){100,100};
        
        [self.cellAttributes addObject:attr];
    }

}


-(CGSize)collectionViewContentSize {
//    
//    CGFloat maxX = CGRectGetMaxX(<#CGRect rect#>)
    return (CGSize){CGRectGetWidth(self.collectionView.frame)*2, CGRectGetHeight(self.collectionView.frame)};
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *tempArray = [NSMutableArray new];

    for (UICollectionViewLayoutAttributes *attr in self.cellAttributes) {
        
        if (CGRectIntersectsRect(rect, attr.frame)) {
            [tempArray addObject:attr];
        }
        
    }

    return tempArray;
}


@end
