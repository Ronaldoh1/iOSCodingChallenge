//
//  ViewController.m
//  iOSCodingChallenge
//
//  Created by Administrator on 5/6/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import "ProductsListVC.h"
#import "ToMoProductsDownloader.h"
#import "productCustomCell.h"
#import "Product.h"

@interface ProductsListVC ()<ToMoItemsDownloaderDelegate, UITableViewDelegate, UITableViewDataSource>

@property ToMoProductsDownloader *downloader;
@property NSMutableArray *productsArray;
@property NSMutableArray *sortedProductsArray;
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
    self.sortedProductsArray = [NSMutableArray new];


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
        NSLog(@"%@ hii", dict);

        Product *product = [[Product alloc]initWithDictionary:dict];

        [self.productsArray addObject:product];

    }

    //sort the array
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"price"
                                                  ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray;

    sortedArray = [self.productsArray sortedArrayUsingDescriptors:sortDescriptors];

    self.sortedProductsArray = [NSMutableArray arrayWithArray:sortedArray.copy];

    [self.tableView reloadData];




}

#pragma mark - UITableView Delegate & Datasource Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.sortedProductsArray count];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

     [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextAlignment:NSTextAlignmentCenter];

    return @"TODAY'S SALES";
}

-(productCustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //initialize the cell.
    productCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    //create a temp product object
    Product *product = [Product new];

    //set temp product to product for product array at current indexPath.row
    product = (Product *) self.sortedProductsArray[indexPath.row];

    //get the Image from URL

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                       ^{

                           NSURL *imageURL = [NSURL URLWithString:product.imageURL];
                           NSData *imageData = [NSData dataWithContentsOfURL:imageURL];

                           //Set the image for each cell on the main thread.
                           dispatch_sync(dispatch_get_main_queue(), ^{


                               if (imageData != nil) {

                                   cell.productImage.alpha = 0.0;

                                   [UIView animateWithDuration:1.0
                                                    animations:^{
                                                        cell.productImage.alpha = 1.0;

                                cell.productImage.image = [UIImage imageWithData:imageData];
                                    }];
                               }else{

                                   [cell.productImage setBackgroundColor:[UIColor redColor]];
                               }




                           });
                       });


    
    cell.productNameAndPrice.text = [NSString stringWithFormat:@"$%@ \n%@", product.price, product.productName];

    cell.productDescription.text = product.productDescription;


    return cell;

}



@end
