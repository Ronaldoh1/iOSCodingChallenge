//
//  ToMoItemsDownloader.h
//  iOSCodingChallenge
//
//  Created by Ronald Hernandez on 9/7/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ToMoItemsDownloaderDelegate <NSObject>

-(void)gotToMoItems:(NSArray *)itemArray;

@end

@interface ToMoItemsDownloader : NSObject

@property id<ToMoItemsDownloaderDelegate>parentVC;

-(void)downloadItemsFromToMoAPI;


@end
