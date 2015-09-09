//
//  SherdClass.h
//  hss
//
//  Created by ali saleme on 1/5/15.
//  Copyright (c) 2015 ali saleme. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MedicalClass.h"
#import "MedicalTypechildren.h"
#import "LoginInfoClass.h"

@interface SherdClass : NSObject

@property  (nonatomic,retain)NSString * MedicalAPIurl;
@property  (nonatomic,retain)NSMutableArray *ar_Medicals;
@property  (nonatomic,retain) MedicalClass *clsCurrentMedicalType;
@property  (nonatomic,retain) MedicalTypechildren *clsCurrentMedicalChildren;
@property (nonatomic,retain)LoginInfoClass *LoginInfo;

@property (nonatomic,retain)NSMutableArray *ar_invoice;
@property(nonatomic,copy)NSString *UserName;
+(SherdClass *)getInstance;

@end
