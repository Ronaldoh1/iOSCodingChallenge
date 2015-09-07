//
//  ToMoItem.h
//  iOSCodingChallenge
//
//  Created by Ronald Hernandez on 9/7/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property NSString *productDescription;
@property NSString *productName;
@property NSDecimalNumber *price;
@property NSString *imageURL;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;




@end
