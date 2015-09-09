//
//  InvoiceTable.h
//  IOSExamples
//
//  Created by ali saleme on 2/5/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SherdClass.h"
#import "MedicalTypechildren.h"
@interface InvoiceTable : UIViewController{
SherdClass *Sher;
NSMutableArray *ar_invoice;
    IBOutlet UITableView *table;


}
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *quantit;
@property (weak, nonatomic) IBOutlet UILabel *price;
@end
