//
//  EditInvoiceController.h
//  IOSExamples
//
//  Created by ali saleme on 2/11/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "invoiceClass.h"
#import "SherdClass.h"
@interface EditInvoiceController : UIViewController
{
    
    IBOutlet UILabel  *Name;
    IBOutlet UITextField *qantiti;
    IBOutlet UILabel *price;
    IBOutlet UILabel *Description;
    SherdClass *SHH;
    IBOutlet UILabel *total;
    NSString *tot;
    
}

@property(nonatomic,retain)invoiceClass *currentInvoiceClass;

@end
