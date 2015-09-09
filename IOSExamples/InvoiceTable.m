//
//  InvoiceTable.m
//  IOSExamples
//
//  Created by ali saleme on 2/5/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "InvoiceTable.h"
#import "ChildTableViewController.h"
#import "MedicalTypechildren.h"
#import "MyInvoiceCell.h"
#import "invoiceClass.h"

@interface InvoiceTable ()

@end

//MedicalTypechildren *clsMedical;
@implementation InvoiceTable

- (void)viewDidLoad {
    [super viewDidLoad];
        Sher = [SherdClass getInstance];

    
    [self Download2];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return ar_invoice.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyInvoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier2" forIndexPath:indexPath];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"reuseIdentifier2" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
     //NSMutableString *str;
   /* MedicalTypechildren *clsMedical = [Sher.ar_invoice objectAtIndex:(indexPath.row)];
   str =  [NSMutableString stringWithFormat:@" %@ %@",clsMedical.Name,clsMedical.quantiti];
    // Configure the cell...
     cell.textLabel.text = str;*/
    
    invoiceClass *item;
    
    item = [ar_invoice objectAtIndex:indexPath.row];
    
    //NSMutableString *str;
    
    //str = [NSMutableString stringWithFormat:@"%@    %@      ",item.MedN,item.Qu];
    
    cell.name.text = @"ew";
    cell.quantit.text = item.Qu;
    cell.price.text = item.Price;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





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
