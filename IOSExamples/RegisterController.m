//
//  RegisterController.m
//  IOSExamples
//
//  Created by ali saleme on 1/21/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "RegisterController.h"
#import "Center.h"
@interface RegisterController ()

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   Shared = [SherdClass getInstance];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)Register
{
    NSString *errorMessage;
    
    @try{
        
        
        if (txtPassword.text.length >= 6 && [txtConfirmPassword.text isEqualToString:txtPassword.text])
         {
            
            //[self performSelectorInBackground:@selector(StartAnimating) withObject:nil];
            
            NSMutableString *URL =[[NSMutableString alloc] initWithString:Shared.MedicalAPIurl];
             //uploader.php
            [URL appendString:@"/api/Register"];
            NSMutableURLRequest *Request = [[NSMutableURLRequest alloc]init];
            [Request setURL:[NSURL URLWithString:URL]];
            [Request setHTTPMethod:@"POST"];
            //NSLog(URL);
            
            [Request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            
            NSString *postData;
            postData = [NSString stringWithFormat:@"DisplayName=%@&UserName=%@&Password=%@&Phone=%@&Zone=%@&BloodType=%d",
                        txtDisplayName.text, txtUserName.text, txtPassword.text, txtPhoneNumber.text, txtZone.text, 1];
            //NSLog(postData);
            
            NSData *body;
            body = [postData dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            [Request setHTTPBody:body];
            
            NSError *err = nil;
            NSHTTPURLResponse *res = nil;
            NSData *returnData = [NSURLConnection sendSynchronousRequest:Request returningResponse:&res error:&err];
            NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
            
            
            if ([returnString isEqualToString:@"Success"]) {
                
                Shared.UserName = txtUserName.text;
                
                UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Register" message:returnString delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [myAlert show];
               // [self.navigationController popViewControllerAnimated:YES];
                Center *EditInvoiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Center"];
                [self.navigationController pushViewController:EditInvoiceVC animated:true];
                
            }
            else
            {
                UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Register" message:returnString delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [myAlert show];
            }
            
         }
            
        else
            
        {
            
            
             if (txtPassword.text.length < 6){
                errorMessage = @"يجب أن تكون كلمة المرور أكبر من خمسة أحرف";
            }
            
            else if (![txtConfirmPassword.text isEqualToString:txtPassword.text]){
                errorMessage = @"كلمة المرور وتأكيد كلمة المرور لا تتطابق";
            }
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"خطأ" message:errorMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
            
            
            
        }
        @catch (NSException *exception) {
                
        }
            
        @finally {
         [activityIndicator stopAnimating];
            

        }
}

            
@end
