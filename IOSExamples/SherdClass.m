//
//  SherdClass.m
//  hss
//
//  Created by ali saleme on 1/5/15.
//  Copyright (c) 2015 ali saleme. All rights reserved.
//

#import "SherdClass.h"

@implementation SherdClass
@synthesize MedicalAPIurl,ar_Medicals,clsCurrentMedicalType, clsCurrentMedicalChildren,ar_invoice,UserName,LoginInfo;

static SherdClass *instance = nil;

+(SherdClass *)getInstance
{
    @synchronized(self)
    {
        if (instance == nil)
        {
        
            instance = [SherdClass new];
            instance.MedicalAPIurl = @"http://172.16.74.137:5000";
            instance.ar_invoice = [[NSMutableArray alloc] init];
            
        }
    }
    return instance;
}



@end
