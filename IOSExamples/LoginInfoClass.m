//
//  LoginInfoClass.m
//  IOSExamples
//
//  Created by ali saleme on 1/27/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "LoginInfoClass.h"

@implementation LoginInfoClass

@synthesize access_token,success,expires_in,refresh_token,UserName,LoginDate,password,DonorID;

-(id)initWithaccess_token:(NSString *)pAccess_token
               expires_in:(NSString *)pExpires_in
            refresh_token:(NSString *)pRefresh_token
                 UserName:(NSString *)pUserName
                  success:(NSString *)pSuccess
                LoginDate:(NSDate   *)pLoginDate
                 password:(NSString *)pPassword
                  DonorID:(NSString *)pDonorID

{
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's initialization fail?
    if (!self)
        return nil;
    
    [self setAccess_token:pAccess_token];
    [self setExpires_in:pExpires_in];
    [self setRefresh_token:pRefresh_token];
    [self setUserName:pUserName];
    [self setSuccess:pSuccess];
    [self setLoginDate:pLoginDate];
    [self setPassword:pPassword];
    [self setDonorID:pDonorID];
    
    return self;
}
@end
