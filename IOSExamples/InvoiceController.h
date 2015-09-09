//
//  InvoiceController.h
//  IOSExamples
//
//  Created by ali saleme on 2/3/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SherdClass.h"
#import "ChildTableViewController.h"
#import "MedicalInfo.m"
#import "MedicalTypechildren.h"
#import "TableViewCell.h"
@interface InvoiceController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *Table;
    SherdClass *Sher;
    NSMutableArray *ar_invoice;
    
    
    
}
-(void)Download2;
@end
