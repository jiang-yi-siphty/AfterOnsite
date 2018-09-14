//
//  City.m
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithName:(NSString *)name countryName:(NSString *)countryName latitude:(NSNumber *)latitude longtitude:(NSNumber *)longtitude
{
    self = [super init];
    if (self) {
        _name = name;
        _countryName = countryName;
        _latitude = latitude;
        _longtitude = longtitude;
    }
    return self;
}

@end
