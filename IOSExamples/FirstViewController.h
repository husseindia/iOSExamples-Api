//
//  FirstViewController.h
//  hss
//
//  Created by ali saleme on 11/30/14.
//  Copyright (c) 2014 ali saleme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myCell.h"
#import "SherdClass.h"
#import "EditInvoiceController.h"

@interface FirstViewController :  UIViewController <UITableViewDelegate, UITableViewDataSource>{
    IBOutlet UITableView *table;
    SherdClass  *Sher;
NSMutableArray *ar_invoice;
    NSIndexPath *currentIndexPath;
    //UIViewController *cc;
}

@end
