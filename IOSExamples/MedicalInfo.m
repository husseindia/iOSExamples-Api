//
//  MedicalInfo.m
//  IOSExamples
//
//  Created by ali saleme on 1/17/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "MedicalInfo.h"
#import "Center.h"
//#import "ChildTableViewController.h"
@interface MedicalInfo (){
    NSString *nas;
   
}

@end

@implementation MedicalInfo

- (IBAction)addtoInvoice:(id)sender {
    @try {
        
        
        
        NSMutableString *URL = [[NSMutableString alloc] initWithString:SHH.MedicalAPIurl];
        [URL appendString:@"/Invoice/Invoice?pharmName="];
        [URL appendString:SHH.LoginInfo.UserName];
        [URL appendString:@"&medicalId="];
        [URL appendString:[NSString stringWithFormat:@"%@",SHH.clsCurrentMedicalChildren.Id]];
        [URL appendString:@"&quantiti="];
        [URL appendString:[NSString stringWithFormat:@"%ld",(long)QuantitRequired]];
        
        NSData *data;
        
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL]];
        
        NSString* strResult = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        strResult = [strResult stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        if ([strResult isEqualToString:@"Success"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"message box" message:@"add to cart" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
             [SHH.ar_invoice addObject:SHH.clsCurrentMedicalChildren];
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
    
    blnAdded = false;
    
    SHH = [SherdClass getInstance];
   // [self DownMedicalWithType];
    [self downImage];
    
    if (SHH.clsCurrentMedicalChildren.quantiti > 0)
    {
        QuantitRequired = 1;
    }else{
        QuantitRequired = 0;
    }
    
    Name.text = SHH.clsCurrentMedicalChildren.Name;
    price.text = SHH.clsCurrentMedicalChildren.price;
    qantiti.text = SHH.clsCurrentMedicalChildren.quantiti;
    Description.text = SHH.clsCurrentMedicalChildren.Description;
    [self downImage];
 
   
 
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    nsname = SHH.clsCurrentMedicalChildren.Name;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)DownMedicalWithType
{
    @try {
        
        NSMutableString *strURL = [[NSMutableString alloc] initWithString: SHH.MedicalAPIurl];
        [strURL appendString:@"/Medical/GetMedicalWithType?parentID="];
        [strURL appendString:SHH.clsCurrentMedicalType.Id];
        
        
        NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:strURL]];
        
        NSDictionary *MedicalDictionary;
        
        if(data.length !=0){
            MedicalDictionary   =   [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            MedicalTypechildren *clsMedicalChildren;
            ar_MedicalChildrens =[[NSMutableArray alloc ] init];
            
            if(![[MedicalDictionary description] isEqualToString:@"<null>"]){
                for(NSDictionary *item in MedicalDictionary)
                {
                    
                    
                    clsMedicalChildren = [[MedicalTypechildren alloc ] initWithId:[item objectForKey:@"id"] Pid:[item objectForKey:@"ParentId"] Name:[item objectForKey:@"name"] quantiti:[item objectForKey:@"quantiti"] MediaThwmbnail:[item objectForKey:@"MediaThwmbnail"] Description:[item objectForKey:@"Description"] price:[item objectForKey:@"price"]];
                    
                    [ar_MedicalChildrens addObject:clsMedicalChildren];
                   
                }
                
            }
            
        }
        
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}


-(void)downImage{
    NSMutableString *strURL = [[NSMutableString alloc] initWithString: SHH.MedicalAPIurl];
    [strURL appendString:@"/images/"];
    [strURL appendString: [NSString stringWithFormat:@"%@",[SHH.clsCurrentMedicalChildren.Name stringByReplacingOccurrencesOfString:@" " withString:@""]]];
    [strURL appendString:@".jpeg"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:strURL]];
    image.Image = [UIImage imageWithData:data];
    
    //image = [[UIImageView alloc] initWithImage:[image imageWithData:data]];
    
}











-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [SHH.clsCurrentMedicalChildren.quantiti integerValue];
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component  {
    return [NSString stringWithFormat:@"%ld",(long)row + 1];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    QuantitRequired = row + 1;
    
}


@end

