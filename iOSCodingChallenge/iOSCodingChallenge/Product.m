//
//  ToMoItem.m
//  iOSCodingChallenge
//
//  Created by Ronald Hernandez on 9/7/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import "Product.h"

@implementation Product



-(instancetype)initWithDictionary:(NSDictionary *)dictionary{

    self = [super self];

    self.productName = [dictionary objectForKey:@"name"];
    self.imageURL = [dictionary objectForKey:@"image"];
    self.productDescription = [dictionary objectForKey:@"description"];


    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:NSRoundUp
                                       scale:2
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:YES
                                       raiseOnDivideByZero:NO];

    self.price = [[NSDecimalNumber decimalNumberWithString:[[dictionary objectForKey:@"price"] stringValue]] decimalNumberByRoundingAccordingToBehavior:roundUp];

    return self;
}

@end
