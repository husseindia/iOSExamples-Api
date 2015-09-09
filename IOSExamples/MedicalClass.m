//
//  MedicalClass.m
//  hss
//
//  Created by ali saleme on 1/5/15.
//  Copyright (c) 2015 ali saleme. All rights reserved.
//

#import "MedicalClass.h"

@implementation MedicalClass : NSObject
@synthesize Id,Type;

    
-(id)initWithId:(NSString *)pId
          type : (NSString *) ptype

    {
        self = [super init];
        if (!self)
            return nil;
        
        [self setId:pId];
        [self setType:ptype];
        
        
        return self;
        
    }

@end

//@implementation MedicalTypechildren : NSObject


//@end