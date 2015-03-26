//
//  FirstViewController.m
//  OFAExample
//
//  Created by Manuel Meyer on 16/03/15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

#import "FirstViewController.h"
#import <ofapopulator/OFAViewPopulator.h>
#import <ofapopulator/OFASectionPopulator.h>

#import "ColorDataFetcher.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) OFAViewPopulator *viewPopulator;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OFASectionPopulator *colorPopulator = [[OFASectionPopulator alloc] initWithParentView:self.tableView
                                                                              dataFetcher:[[ColorDataFetcher alloc] init]
                                                                           cellIdentifier:^NSString *(id obj, NSIndexPath *indexPath) {
                                                                               return @"ColorCell";
                                                                           } cellConfigurator:^(UIColor *color, UITableViewCell *cell, NSIndexPath *indexPath) {
                                                                               [cell.contentView setBackgroundColor:color];
                                                                           }];
    self.viewPopulator = [[OFAViewPopulator alloc] initWithParentView:self.tableView sectionPopulators:@[colorPopulator]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
