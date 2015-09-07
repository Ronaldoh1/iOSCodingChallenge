//
//  ToMoItemsDownloader.m
//  iOSCodingChallenge
//
//  Created by Ronald Hernandez on 9/7/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import "ToMoProductsDownloader.h"

@implementation ToMoProductsDownloader

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

        }else{

            [self displayAlertMessage:@"Connection Error!" andWith:connectionError.localizedDescription];


        }

    }];

}


-(void)processData:(NSData *)data{

    //Need to store all of the items in an arary.
    //We get back a dictionary of dictionary
    NSDictionary *itemsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

    NSMutableArray *tempProductsArray = [NSMutableArray new];

    for (NSDictionary *ProductDict in itemsDictionary) {

        [tempProductsArray addObject:ProductDict];

    }

    [self.parentVC gotToMoProducts:tempProductsArray];

}


-(void)displayAlertMessage:(NSString *)title andWith:(NSString *)message{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title
                                                   message:message
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil, nil];
    [alert show];
}

@end
