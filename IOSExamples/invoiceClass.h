//
//  invoiceClass.h
//  IOSExamples
//
//  Created by ali saleme on 2/4/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface invoiceClass : NSObject
{
    NSString *Id;
    NSString *phn;
    NSString *MedN;
    NSString *Qu;
    NSString *Price;
    
}
@property  (nonatomic,copy)NSString *Id;
@property  (nonatomic,copy)NSString *phn;
@property  (nonatomic,copy)NSString *MedN;
@property  (nonatomic,copy)NSString *Qu;
@property  (nonatomic,copy)NSString *Price;
-(id)initWithId:(NSString *)pId
          phn  :(NSString *)pphn
          MedN :(NSString*)pMedN
            Qu :(NSString*)pQu
         Price : (NSString *)PPrice;
@end
