//
//  ViewController.m
//  iOSCodingChallenge
//
//  Created by Administrator on 5/6/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import "ItemsListViewController.h"
#import "ToMoItemsDownloader.h"

@interface ItemsListViewController ()<ToMoItemsDownloaderDelegate>

@property ToMoItemsDownloader *downloader;
@property NSMutableArray *itemsArray;

@end

@implementation ItemsListViewController

static NSString *const iosCodingChallengeUrlString = @"https://public.touchofmodern.com/ioschallenge.json";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //fetch json products and refresh view

    self.downloader = [ToMoItemsDownloader new];
    self.downloader.parentVC = self;
    [self.downloader downloadItemsWithToMoApi:iosCodingChallengeUrlString];


    //allocate and initialie dictionary to hold the ToMo Items


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
