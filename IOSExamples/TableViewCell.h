//
//  TableViewCell.h
//  IOSExamples
//
//  Created by ali saleme on 2/5/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *name;
@property (weak, nonatomic) IBOutlet UIView *quantit;
@property (weak, nonatomic) IBOutlet UIView *price;

@end
