//
//  invoiceClass.m
//  IOSExamples
//
//  Created by ali saleme on 2/4/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "invoiceClass.h"

@implementation invoiceClass
@synthesize Id,Qu,phn,MedN,Price;


-(id)initWithId:(NSString *)pId
          phn  :(NSString *)pphn
          MedN :(NSString*)pMedN
            Qu :(NSString*)pQu
         Price : (NSString *)PPrice;


{
    self = [super init];
    if (!self)
        return nil;
    
    [self setId:pId];
    [self setPhn:pphn];
    [self setQu:pQu];
    [self setMedN:pMedN];
    [self setPrice:PPrice];
    
    
    return self;
    
}
@end
