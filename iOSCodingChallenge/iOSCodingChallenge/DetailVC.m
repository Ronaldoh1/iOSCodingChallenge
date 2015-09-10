//
//  DetailVC.m
//  iOSCodingChallenge
//
//  Created by Ronald Hernandez on 9/9/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    /*Populate Product information to provide more detail for user. */

    self.descriptionTextView.text = self.product.productDescription;

    NSURL *imageURL = [NSURL URLWithString:self.product.imageURL];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];

    self.productImage.image = [UIImage imageWithData:imageData];
    self.priceLabel.text =[NSString stringWithFormat:@"$%@", self.product.price];

    //Set the title for the VC.
    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    titleView.font = [UIFont fontWithName:@"Helvetica Bold" size:20];
    titleView.text = self.product.productName;
    titleView.textColor = [UIColor whiteColor];
    [self.navigationItem setTitleView:titleView];
    
    
}




@end
