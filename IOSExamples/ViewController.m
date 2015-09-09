//
//  ViewController.m
//  IOSExamples
//
//  Created by Ravi Shankar on 09/01/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *cities;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    sherd = [SherdClass getInstance];
   // cities = [[NSMutableArray alloc] init];
   // self.letterData = sherd.ar_Medicals;
    [self Download];
    [super viewDidLoad];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refresh:)
    forControlEvents:UIControlEventValueChanged];
    
    //Create the list of cities that will be displayed in the tableview
   /* for(MedicalClass *item in sherd.ar_Medicals)
    [cities addObject:item.Type];*/

}


-(void)Download {
    @try {
        NSMutableString *strURL = [[NSMutableString alloc] initWithString: sherd.MedicalAPIurl];
        [strURL appendString:@"/MedicalType/GetAllMedicalType"];
        NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:strURL]];
        
        NSDictionary *MedicalDictionary;
        
        if(data.length !=0){
            MedicalDictionary   =   [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            MedicalClass *clsMedical;
           sherd.ar_Medicals =[[NSMutableArray alloc ] init];
            
            if(![[MedicalDictionary description] isEqualToString:@"<null>"]){
                for(NSDictionary *item in MedicalDictionary)
                {
                    clsMedical = [[MedicalClass alloc ] initWithId:[item objectForKey:@"id"] type:[item objectForKey:@"Type"]];
                    
                    [sherd.ar_Medicals addObject:clsMedical];
                    
                }
            }
        }
        
        
        
        
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        [self.refreshControl endRefreshing];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sherd.ar_Medicals count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cities"];
    
    MedicalClass *clsMedical1;
    clsMedical1 = [sherd.ar_Medicals objectAtIndex:indexPath.row];
    cell.textLabel.text =clsMedical1.Type;
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    sherd.clsCurrentMedicalType = [sherd.ar_Medicals objectAtIndex:indexPath.row];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)refresh:(UIRefreshControl *)refreshControl {
    [self Download];
    [self.tableView reloadData];
    
}

@end
