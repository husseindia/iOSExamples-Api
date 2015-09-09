//
//  MyInvoiceCell.h
//  IOSExamples
//
//  Created by ali saleme on 2/11/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInvoiceCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UILabel *quantit;
@property (nonatomic, weak) IBOutlet UILabel *price;
@end
