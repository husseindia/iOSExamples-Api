//
//  login.m
//  hss
//
//  Created by ali saleme on 11/30/14.
//  Copyright (c) 2014 ali saleme. All rights reserved.
//

#import "login.h"
#import "Center.h"
@interface login ()

@end


@implementation login


- (void)viewDidLoad {
    [super viewDidLoad];
    
    SHErd = [SherdClass getInstance];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(IBAction)LogIn
{
    /*UIAlertView  *waitAlert = [[UIAlertView alloc] initWithTitle:@"Please Wait...." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    [waitAlert show];*/
    
    
    @try{

        if (Password.text.length >= 6)
            {
            NSMutableString *URL = [[NSMutableString alloc] initWithString:SHErd.MedicalAPIurl];
            [URL appendString:@"/api/login?"];
            [URL appendString:@"username="];
            [URL appendString:UserName.text];
            [URL appendString:@"&password="];
            [URL appendString:Password.text];
            NSLog(URL);
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                //background processing goes here
                //This is where you download your data
                
                @try{
                    
                    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL]];
                    //[self performSelectorOnMainThread:@selector(GetRequestToken:) withObject:data waitUntilDone:YES];//});
                    [self GetRequestToken:data];
                    //[self performSelector:@selector(GetRequestToken:) withObject:data];
                }
                @catch (NSException *exception) {
                    
                }
                @finally {
                    
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    //update UI here
                    
                    if ([SHErd.LoginInfo.success boolValue]) {
                        
                        UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Login" message:@"Success." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                        [myAlert show];

                        
                        
                       
                        
                       Center *EditInvoiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Center"];
                       [self.navigationController pushViewController:EditInvoiceVC animated:true];
  
                         }else{
                         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"خطأ" message:@"البريد الإلكتروني أو كلمة المرور غير صحيحة" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                         [alert show];
                         
                         }
                         
                         
                         });
                         });
            }
    
    
                       //  else if(![Shared validateEmail:txtLoginUserName.text]) {

        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"خطأ" message:@"كلمة المرور غير صحيحة" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }
        
    }
    @catch (NSException *exception) {
        /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:exception.description delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
         [alert show]*/
         }
         @finally {
        // [activityIndicator stopAnimating];
         /*[btnLogin.titleLabel setFont:[Manager GetCustomFont:25 :TRUE]];
         btnLogin.titleLabel.text=[Manager ConvertToArabic:btnLogin.titleLabel.text]*/
         }
         }
-(void)GetRequestToken:(NSData *)responseData
{
    @try {
        NSDictionary *News;
        NSError *error;
        
        if (responseData.length != 0)
        {
            News = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
            
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy/MM/dd HH:mm"];
            NSDate *date = [dateFormat dateFromString:[News objectForKey:@"LastDonationDate"]];  //]@"2013/08/15 17:12"];
            
            SHErd.LoginInfo = [[LoginInfoClass alloc] initWithaccess_token:[News objectForKey:@"access_token"] expires_in:[News objectForKey:@"expires_in"] refresh_token:[News objectForKey:@"refresh_token"]  UserName:UserName.text success:[News objectForKey:@"success"] LoginDate:[NSDate date] password:Password.text DonorID:[News objectForKey:@"DonorID"]];
            
            NSLog(@"%@ 111111",[News objectForKey:@"IsFirstTimeDonor"]);
             
             }
             else
             {
             UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"You require an internet connection via WiFi or cellular to work." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
             [myAlert show];
             }
             }
             @catch (NSException *exception) {
             //[[SharedData getInstance] Log:exception];
             }
             @finally {
             
             }
             
             }


@end
