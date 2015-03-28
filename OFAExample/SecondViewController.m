//
//  SecondViewController.m
//  OFAExample
//
//  Created by Manuel Meyer on 16/03/15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

#import "SecondViewController.h"
#import "ColorDataProvider.h"
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
    
    ColorDataProvider *colorDataProvider = [[ColorDataProvider alloc] init];
    OFASectionPopulator *sectionPopulator = [[OFASectionPopulator alloc] initWithParentView:self.collectionView
                                                                                dataProvider:colorDataProvider
                                                                             cellIdentifier:^(id obj, NSIndexPath *indexPath){
                                                                                 return @"CellSectionColor";
                                                                             }
                                                                           cellConfigurator:^(UIColor *color, UICollectionViewCell *cell, NSIndexPath *indexPath)
    {
        cell.backgroundColor = color;
    }];
    self.viewPopulator = [[OFAViewPopulator alloc] initWithSectionPopulators:@[sectionPopulator]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
