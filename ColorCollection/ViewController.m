//
//  ViewController.m
//  ColorCollection
//
//  Created by Cory Alder on 2015-06-26.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *colors;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    srand48(time(0));
    
    
    self.colors = [NSMutableArray arrayWithObject:[UIColor magentaColor]];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.colors count];

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ColorCell" forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = self.colors[indexPath.item];

    return cell;
}

- (IBAction)addColor:(id)sender {
    CGFloat random1 = drand48();
    CGFloat random2 = drand48();
    CGFloat random3 = drand48();
    
    UIColor *randomColor = [UIColor colorWithRed:random1 green:random2 blue:random3 alpha:1.0];
    
    [self.collectionView performBatchUpdates:^{
        [self.colors insertObject:randomColor atIndex:0];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        
        [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
    } completion:nil];
    

}



@end
