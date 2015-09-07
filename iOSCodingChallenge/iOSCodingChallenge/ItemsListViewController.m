//
//  ViewController.m
//  iOSCodingChallenge
//
//  Created by Administrator on 5/6/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import "ItemsListViewController.h"
#import "ToMoItemsDownloader.h"
#import "ItemCustomCell.h"

@interface ItemsListViewController ()<ToMoItemsDownloaderDelegate, UITableViewDelegate, UITableViewDataSource>

@property ToMoItemsDownloader *downloader;
@property NSMutableArray *itemsArray;

@end

@implementation ItemsListViewController

static NSString *const iosCodingChallengeUrlString = @"https://public.touchofmodern.com/ioschallenge.json";
static NSString *const cellIdentifier = @"itemCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //fetch json products and refresh view

    self.downloader = [ToMoItemsDownloader new];
    self.downloader.parentVC = self;
    [self.downloader downloadItemsWithToMoApi:iosCodingChallengeUrlString];


    //allocate and initialie dictionary to hold the ToMo Items


     NSLog(@"%@ yoooo ", self.itemsArray);




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)gotToMoItems:(NSArray *)itemArray{


    self.itemsArray = [NSMutableArray arrayWithArray:itemArray];
}

#pragma mark - UITableView Delegate & Datasource Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;
}

-(ItemCustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ItemCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];



    return cell;


}

@end
