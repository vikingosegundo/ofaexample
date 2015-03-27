//
//  ColorDataFetcher.m
//  OFAExample
//
//  Created by Manuel Meyer on 16/03/15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//


#import "ColorDataProvider.h"

@interface ColorDataProvider ()
@property (strong, nonatomic) NSArray *colors;
@end

@implementation ColorDataProvider
@synthesize sectionObjects = _sectionObjects;

-(void)dataAvailable:(void (^)(void))available
{
    
    NSMutableArray *colors = [@[] mutableCopy];
    for (int i = 0; i < 360; i+=2){
        [colors addObject:[UIColor colorWithHue:i/360.0 saturation:1 brightness:1 alpha:1]];
    }
    
    self.sectionObjects = colors;
    available();
}

@end
