//
//  MedicalTypechildren.m
//  IOSExamples
//
//  Created by ali saleme on 1/15/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "MedicalTypechildren.h"

@implementation MedicalTypechildren : NSObject
@synthesize Id, PId, Name, quantiti, MediaThwmbnail, price, Description;


-(id)initWithId : (NSString *)pId
            Pid : (NSString *)pPId
           Name : (NSString *)pName
       quantiti : (NSString *)pquantiti
  MediaThwmbnail: (NSString *)pMediaThwmbnail
    Description : (NSString *)pDescription
          price : (NSString *)pprice

{
    
    //self = [super init];
    self = [super init];
    
    if (!self)
        return nil;
    
    [self setId:pId];
    [self setPId:pPId];
    [self setName:pName];
    [self setQuantiti:pquantiti];
    [self setMediaThwmbnail:pMediaThwmbnail];
    [self setDescription:pDescription];
    [self setPrice:pprice];
    
    
    return self;
}

@end
