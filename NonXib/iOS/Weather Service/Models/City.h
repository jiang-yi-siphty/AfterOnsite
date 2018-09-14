//
//  City.h
//  Weather
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface City : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *countryName;
@property (nonatomic, readonly) NSNumber *latitude;
@property (nonatomic, readonly) NSNumber *longtitude;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithName:(NSString *)name
                 countryName:(NSString *)countryName
                    latitude:(NSNumber *)latitude
                  longtitude:(NSNumber *)longtitude NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
