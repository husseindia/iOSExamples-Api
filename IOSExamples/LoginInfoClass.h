//
//  LoginInfoClass.h
//  IOSExamples
//
//  Created by ali saleme on 1/27/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginInfoClass : NSObject
{
    
    NSString *access_token;
    NSString *expires_in;
    NSString *refresh_token;
    NSString *UserName;
    NSString * success;
    NSDate *LoginDate;
    NSString * password;
    NSString *DonorID;
    
}

-(id)initWithaccess_token:(NSString *)pAccess_token
               expires_in:(NSString *)pExpires_in
            refresh_token:(NSString *)pRefresh_token
                 UserName:(NSString *)pUserName
                  success:(NSString *)pSuccess
                LoginDate:(NSDate   *)pLoginDate
                 password:(NSString *)pPassword
                  DonorID:(NSString *)pDonorID;


@property(nonatomic, copy)NSString *access_token;
@property(nonatomic, copy)NSString *expires_in;
@property(nonatomic, copy)NSString *refresh_token;
@property(nonatomic, copy)NSString *UserName;
@property(nonatomic, copy)NSString * success;
@property(nonatomic, copy)NSDate   * LoginDate;
@property(nonatomic, copy)NSString * password;
@property(nonatomic, copy)NSString *DonorID;

@end
