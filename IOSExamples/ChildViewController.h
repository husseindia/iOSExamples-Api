//
//  ChildViewController.h
//  IOSExamples
//
//  Created by ali saleme on 1/15/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MedicalTypechildren.h"
#import "SherdClass.m"

@interface ChildViewController : UITableViewController
{
    SherdClass *Shared;
    NSMutableArray  *ar_MedicalChildrens;
}
@end
