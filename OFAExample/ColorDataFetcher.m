//
//  ColorDataFetcher.m
//  OFAExample
//
//  Created by Manuel Meyer on 16/03/15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//


#import "ColorDataFetcher.h"

@interface ColorDataFetcher ()
@property (strong, nonatomic) NSArray *colors;
@end

@implementation ColorDataFetcher
@synthesize sectionObjects = _sectionObjects;

-(void)fetchSuccess:(void (^)(void))success
{
    
    NSMutableArray *colors = [@[] mutableCopy];
    for (int i = 0; i < 360; i+=2){
        [colors addObject:[UIColor colorWithHue:i/360.0 saturation:1 brightness:1 alpha:1]];
    }
    
    self.sectionObjects = colors;
    success();
}

-(void)fetchedData:(id)obj onDataFetcher:(id<OFADataFetcher>)dataFetcher
{
    
}


@end
