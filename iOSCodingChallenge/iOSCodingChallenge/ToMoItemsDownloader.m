//
//  ToMoItemsDownloader.m
//  iOSCodingChallenge
//
//  Created by Ronald Hernandez on 9/7/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import "ToMoItemsDownloader.h"

@implementation ToMoItemsDownloader

/* pull ToMo Items information and store them in an array and provide the ParentVC (ListVC) with items */

-(void)downloadItemsWithToMoApi:(NSString *)apiString{

//1. Create a URL with API String provided.
    NSURL *url = [NSURL URLWithString:apiString];

//2. Create request.
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

//3. Get items from ToMo Webservice.
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {


//If the connection failed and then data will be nil. Need to check if data != nil and then process that data.

        if (data != nil) {


            [self processData:data];

        }

    }];

}


-(void)processData:(NSData *)data{

    //Need to store all of the items in an arary.
    NSDictionary *itemsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

}

@end
