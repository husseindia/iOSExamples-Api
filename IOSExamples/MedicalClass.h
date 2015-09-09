//
//  MedicalClass.h
//  hss
//
//  Created by ali saleme on 1/5/15.
//  Copyright (c) 2015 ali saleme. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MedicalClass : NSObject
{
    NSString *Id;
    NSString *Type;
   
}
@property (nonatomic,copy)NSString *Id;
@property  (nonatomic,copy)NSString *Type;
-(id)initWithId:(NSString *)pId
          type : (NSString *) ptype;
@end





