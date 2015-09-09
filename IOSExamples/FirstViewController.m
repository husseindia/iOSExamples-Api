
//  FirstViewController.m
//  hss
//
//  Created by ali saleme on 11/30/14.
//  Copyright (c) 2014 ali saleme. All rights reserved.
//

#import "FirstViewController.h"
#import "invoiceClass.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    Sher = [SherdClass getInstance];
    
    [self Download2];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ar_invoice count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"myCell";
    
    myCell *cell = (myCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"myCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    invoiceClass *item;
    
    item = [ar_invoice objectAtIndex:indexPath.row];

    cell.nameLabel.text = item.MedN;
    cell.prepTimeLabel.text =item.Qu;
    cell.thumbnailImageView.text = item.Price;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    currentIndexPath = indexPath;
    
    // Checked the selected row
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.accessoryType==UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    EditInvoiceController *EditInvoiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"EditInvoiceController"];
    
    //[[EditInvoiceController alloc] initWithNibName:@"EditInvoiceController" bundle:[NSBundle mainBundle]];
    EditInvoiceVC.currentInvoiceClass = [ar_invoice objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:EditInvoiceVC animated:true];
    
    
}


-(void)Download2 {
    
    NSMutableString *strURL = [[NSMutableString alloc] initWithString: Sher.MedicalAPIurl];
    [strURL appendString:@"/invoice/GetAllMedicalType?pharmName="];
    [strURL appendString:Sher.LoginInfo.UserName];
    
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:strURL]];
    
    NSDictionary *MedicalDictionary;
    
    if(data.length !=0){
        MedicalDictionary   =   [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        invoiceClass *Invoice;
        ar_invoice = [[NSMutableArray alloc ] init];
        
        if(![[MedicalDictionary description] isEqualToString:@"<null>"]){
            for(NSDictionary *item in MedicalDictionary)
            {
                /* Invoice =[[invoiceClass alloc] initWithId:@"id" phn:@"pharmName" MedN:@"medicalName" Qu:@"quantiti"];*/
                
                
                Invoice = [[invoiceClass alloc] initWithId:[item objectForKey:@"id"] phn:[item objectForKey:@"pharmName"] MedN:[item objectForKey:@"medicalName"] Qu: [NSString stringWithFormat:@"%@",[item objectForKey:@"quantiti"]] Price:[NSString stringWithFormat:@"%@",[item objectForKey:@"price"]]];
                
                [ar_invoice addObject:Invoice];
                //[sherd.ar_Medicals addObject:clsMedical];
                [table reloadData];
                
            }
        
        }
    }

}


@end
