//
//  ViewController.h
//  IOSExamples
//
//  Created by Ravi Shankar on 09/01/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SherdClass.h"
#import "MedicalClass.h"
#import "MedicalButton.h"  
#import "MedicalTypechildren.h"
#import "RegisterController.h"
//#import "rejister1.h"
@interface ViewController : UITableViewController
{
    SherdClass *sherd;
    UITableView *table;
    
}
@property (nonatomic,retain) NSMutableArray  *Type;
@property (nonatomic) BOOL isAscending;
@property (nonatomic, strong) NSMutableArray *letterData;
@end
