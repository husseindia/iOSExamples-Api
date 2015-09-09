//
//  login.h
//  hss
//
//  Created by ali saleme on 11/30/14.
//  Copyright (c) 2014 ali saleme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SherdClass.h"
#import "LoginInfoClass.h"
#import "center.h"
@interface login : UIViewController
{
    
    IBOutlet UITextField * UserName;
    IBOutlet UITextField * Password;
     NSIndexPath *currentIndexPath;
    SherdClass *SHErd;
    Center *C;
    
}
-(IBAction)LogIn;

@end
