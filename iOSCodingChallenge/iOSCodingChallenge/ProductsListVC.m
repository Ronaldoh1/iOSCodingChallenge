//
//  ViewController.m
//  iOSCodingChallenge
//
//  Created by Administrator on 5/6/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import "ProductsListVC.h"
#import "ToMoProductsDownloader.h"
#import "ItemCustomCell.h"
#import "Product.h"

@interface ProductsListVC ()<ToMoItemsDownloaderDelegate, UITableViewDelegate, UITableViewDataSource>

@property ToMoProductsDownloader *downloader;
@property NSMutableArray *productsArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ProductsListVC

static NSString *const iosCodingChallengeUrlString = @"https://public.touchofmodern.com/ioschallenge.json";
static NSString *const cellIdentifier = @"itemCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //fetch json products and refresh view

    //allocate and initialie dictionary to hold the ToMo Items
    self.productsArray = [NSMutableArray new];



    self.downloader = [ToMoProductsDownloader new];
    self.downloader.parentVC = self;
    [self.downloader downloadItemsWithToMoApi:iosCodingChallengeUrlString];


    NSLog(@"%@ got ittt", self.productsArray);



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//Got an arrray of dictionaries. Need to convert to Array of Products 

-(void)gotToMoProducts:(NSArray *)array{

    //NSLog(@"%@ this is ittttttttttttttttt", itemArray);

    for(NSDictionary *dict in array){

        Product *product = [[Product alloc]initWithDictionary:dict];

        [self.productsArray addObject:product];

    }

    [self.tableView reloadData];




}

#pragma mark - UITableView Delegate & Datasource Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.productsArray count];
}

-(ItemCustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ItemCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];



    return cell;


}

@end
