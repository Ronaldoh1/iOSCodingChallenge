//
//  ItemCustomCell.h
//  iOSCodingChallenge
//
//  Created by Ronald Hernandez on 9/7/15.
//  Copyright (c) 2015 Touch of Modern. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface productCustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productNameAndPrice;
@property (weak, nonatomic) IBOutlet UITextView *productDescription;

@end
