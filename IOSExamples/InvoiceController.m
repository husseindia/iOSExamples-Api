//
//  InvoiceController.m
//  IOSExamples
//
//  Created by ali saleme on 2/3/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "InvoiceController.h"
#import "MedicalInfo.h"
#import "invoiceClass.h"
@interface InvoiceController ()

@end

@implementation InvoiceController

- (void)viewDidLoad {
    [super viewDidLoad];
      //  Shared = [SherdClass getInstance];
    Sher = [SherdClass getInstance];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)Download2 {


    
        NSMutableString *strURL = [[NSMutableString alloc] initWithString: Sher.MedicalAPIurl];
        [strURL appendString:@"/Invoice/GetAllMedicalType"];
        NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:strURL]];
        
        NSDictionary *MedicalDictionary;
        
        if(data.length !=0){
            MedicalDictionary   =   [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            invoiceClass *Invoice;
           Sher.ar_invoice = [[NSMutableArray alloc ] init];
            
            if(![[MedicalDictionary description] isEqualToString:@"<null>"]){
                for(NSDictionary *item in MedicalDictionary)
                {
                    Invoice =[[invoiceClass alloc] initWithId:@"id" phn:@"phn" MedN:@"MedN" Qu: @"Qu"];
                    [Sher.ar_invoice addObject:Invoice];
                   //[sherd.ar_Medicals addObject:clsMedical];
                    
                }
            
        }
        }
  
    }











@end
