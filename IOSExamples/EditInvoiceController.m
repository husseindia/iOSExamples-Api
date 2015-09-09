//
//  EditInvoiceController.m
//  IOSExamples
//
//  Created by ali saleme on 2/11/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "EditInvoiceController.h"
#import "Center.h"

@interface EditInvoiceController ()

@end

@implementation EditInvoiceController
@synthesize currentInvoiceClass;

- (IBAction)Edit:(id)sender {
    
    @try {

    NSMutableString *URL = [[NSMutableString alloc] initWithString:SHH.MedicalAPIurl];
    [URL appendString:@"/Invoice/EditInvoice?invoiceId="];
    [URL appendString:currentInvoiceClass.Id];
    [URL appendString:@"&quantiti="];
    [URL appendString:[NSString stringWithFormat:@"%@",qantiti.text]];
    [URL appendString:@"&medicalName="];
    [URL appendString:[NSString stringWithFormat:@"%@",[currentInvoiceClass.MedN stringByReplacingOccurrencesOfString:@" " withString:@"%20"]]];
        
    NSData *data;
    
    data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL]];
    
    NSString* strResult = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    strResult = [strResult stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    
    if ([strResult isEqualToString:@"Success"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"message box" message:@"add to cart" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        Center *EditInvoiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Center"];
        [self.navigationController pushViewController:EditInvoiceVC animated:true];
        
       
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message Box" message:@"failed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
    
   }
   @catch (NSException *exception) {
    
   }
   @finally {
    
  }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SHH = [SherdClass getInstance];
    
    Name.text = currentInvoiceClass.MedN;
    qantiti.text = currentInvoiceClass.Qu;
    price.text = currentInvoiceClass.Price;
    [self sumation];
    total.text = tot;
    
      }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)sumation{
   //  int sum = 0;
   // sum = [[sum alloc]currentInvoiceClass.Qu  * currentInvoiceClass.Price ];
    NSInteger number  = [currentInvoiceClass.Qu integerValue]*[currentInvoiceClass.Price integerValue];
    //number = [tot ];
    tot = [NSString stringWithFormat: @"%ld", (long)number];
}

@end
