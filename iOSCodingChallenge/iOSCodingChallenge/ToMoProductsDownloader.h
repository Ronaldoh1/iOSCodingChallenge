//
//  ToMoItemsDownloader.h
//  iOSCodingChallenge
//
//  Created by Ronald Hernandez on 9/7/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ToMoItemsDownloaderDelegate <NSObject>

-(void)gotToMoProducts:(NSArray *)array;

@end

@interface ToMoProductsDownloader : NSObject

@property id<ToMoItemsDownloaderDelegate>parentVC;

-(void)downloadItemsWithToMoApi:(NSString *)apiString;


@end
