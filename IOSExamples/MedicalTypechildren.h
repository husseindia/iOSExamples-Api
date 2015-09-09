//
//  MedicalTypechildren.h
//  IOSExamples
//
//  Created by ali saleme on 1/15/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MedicalTypechildren : NSObject
{
    NSString *Id;
    NSString *PId;
    NSString *Name;
    NSString *quantiti;
    NSString *MediaThwmbnail;
    NSString *Description;
    NSString *price;
}

@property (nonatomic,copy)NSString *Id;
@property (nonatomic,copy)NSString *PId;
@property (nonatomic,copy)NSString *Name;
@property (nonatomic,copy)NSString *quantiti;
@property (nonatomic,copy)NSString *MediaThwmbnail;
@property (nonatomic,copy)NSString *Description;
@property (nonatomic,copy)NSString *price;


-(id)initWithId : (NSString *)pId
            Pid : (NSString *)pPId
           Name : (NSString *)pName
       quantiti : (NSString *)pquantiti
  MediaThwmbnail: (NSString *)pMediaThwmbnail
    Description : (NSString *)pDescription
          price : (NSString *)pprice;

@end
