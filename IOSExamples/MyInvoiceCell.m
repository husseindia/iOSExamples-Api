//
//  MyInvoiceCell.m
//  IOSExamples
//
//  Created by ali saleme on 2/11/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "MyInvoiceCell.h"

@implementation MyInvoiceCell
@synthesize name = _name;
@synthesize quantit = _quantit;
@synthesize price = _price;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
