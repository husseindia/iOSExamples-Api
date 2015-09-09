//
//  RegisterController.h
//  IOSExamples
//
//  Created by ali saleme on 1/21/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SherdClass.h"

@interface RegisterController : UIViewController
{
    
    IBOutlet UIButton *btnFillBloodTypeTable;
    IBOutlet UITextField *txtDisplayName;
    IBOutlet UITextField *txtZone;
    IBOutlet UITextField *txtUserName;
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtConfirmPassword;
    IBOutlet UITextField *txtPhoneNumber;

    IBOutlet UIButton *btnRegister;
    
    BOOL blnShown;

    SherdClass *Shared;
    UIActivityIndicatorView *activityIndicator;
    
    //UIViewController *VCLogin;
    
}

-(IBAction)Register;

@end
