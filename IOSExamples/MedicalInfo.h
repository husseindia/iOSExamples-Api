//
//  MedicalInfo.h
//  IOSExamples
//
//  Created by ali saleme on 1/17/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ChildTableViewController.h"
#import "MedicalTypechildren.h"
#import "SherdClass.h"
@interface MedicalInfo : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
   // MedicalTypechildren *clsMedicalChildren;
   // ChildTableViewController *child;
    SherdClass *SHH;
    NSInteger QuantitRequired;
    
    IBOutlet UILabel  *Name;
    IBOutlet UILabel *qantiti;
    IBOutlet UILabel *price;
    IBOutlet UILabel *Description;
    IBOutlet UIImagePickerController *MediaThwmbnail;
       NSMutableArray  *ar_MedicalChildrens;
     NSString *nsname;
    __weak IBOutlet UILabel *lblInvoiceState;
    __weak IBOutlet UIPickerView *pickerQuantity;
    IBOutlet UIImageView *image;
   
    BOOL blnAdded;
}
@end
