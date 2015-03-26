//
//  SecondViewController.m
//  OFAExample
//
//  Created by Manuel Meyer on 16/03/15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

#import "SecondViewController.h"
#import "ColorDataFetcher.h"
#import <OFAPopulator/OFASectionPopulator.h>
#import <OFAPopulator/OFAViewPopulator.h>

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) OFAViewPopulator *viewPopulator;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ColorDataFetcher *colorDataFetcher = [[ColorDataFetcher alloc] init];
    OFASectionPopulator *sectionPopulator = [[OFASectionPopulator alloc] initWithParentView:self.collectionView
                                                                                dataFetcher:colorDataFetcher
                                                                             cellIdentifier:^(id obj, NSIndexPath *indexPath){
                                                                                 return @"CellSectionColor";
                                                                             }
                                                                           cellConfigurator:^(UIColor *color, UICollectionViewCell *cell, NSIndexPath *indexPath)
    {
        cell.backgroundColor = color;
    }];
    self.viewPopulator = [[OFAViewPopulator alloc] initWithParentView:self.collectionView
                                                    sectionPopulators:@[sectionPopulator]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
