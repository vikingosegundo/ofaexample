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
#import <OFAPopulator/OFAReorderSectionPopulator.h>

#import "ColorDataProvider.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) OFAViewPopulator *viewPopulator;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OFASectionPopulator *colorPopulator = [[OFAReorderSectionPopulator alloc] initWithParentView:self.tableView
                                                                                    dataProvider:[[ColorDataProvider alloc] init]
                                                                                  cellIdentifier:^NSString *(id obj, NSIndexPath *indexPath) { return @ "ColorCell"; }
                                                                                cellConfigurator:^(UIColor *color, UITableViewCell *cell, NSIndexPath *indexPath) { [cell setBackgroundColor:color];}
                                                                                 reorderCallBack:^(id sourceObj, id destinationObj, NSIndexPath *sourceIndexpath, NSIndexPath *destinationIndexPath) { ; }];
    colorPopulator.header = ^(NSUInteger section){
        return ^{
            UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 30)];
            v.backgroundColor = [UIColor cyanColor];
            return v;
        }();
    };
    self.viewPopulator = [[OFAViewPopulator alloc] initWithSectionPopulators:@[colorPopulator]];
}


@end
