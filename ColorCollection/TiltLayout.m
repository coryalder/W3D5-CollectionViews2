//
//  TiltLayout.m
//  ColorCollection
//
//  Created by Cory Alder on 2015-06-26.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "TiltLayout.h"

@implementation TiltLayout

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *elements = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *attr in elements) {
        attr.transform = CGAffineTransformMakeRotation(0.2);
    
    }
    
    return elements;
}

@end
