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

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.descriptionTextView.text = self.product.productDescription;


   NSURL *imageURL = [NSURL URLWithString:self.product.imageURL];
   NSData *imageData = [NSData dataWithContentsOfURL:imageURL];



    self.productImage.image = [UIImage imageWithData:imageData];
}




@end
