//
//  ChildTableViewController.m
//  IOSExamples
//
//  Created by ali saleme on 1/15/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "ChildTableViewController.h"

@interface ChildTableViewController ()

@end

@implementation ChildTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Shared = [SherdClass getInstance];
    [self DownMedicalWithType];
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
    return ar_MedicalChildrens.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    MedicalTypechildren *item;
    item = [ar_MedicalChildrens objectAtIndex:indexPath.row];
    
    NSMutableString *str;
    
    str = [NSMutableString stringWithFormat:@" %@ %@",item.Name,item.quantiti];
    
    cell.textLabel.text = str;
    //cell.detailTextLabel.text
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Shared.clsCurrentMedicalChildren = [ar_MedicalChildrens objectAtIndex:indexPath.row];
    
    
}

-(void)DownMedicalWithType
{
    @try {
        
        NSMutableString *strURL = [[NSMutableString alloc] initWithString: Shared.MedicalAPIurl];
        [strURL appendString:@"/Medical/GetMedicalWithType?parentID="];
        [strURL appendString:Shared.clsCurrentMedicalType.Id];
        
        NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:strURL]];
        
        NSDictionary *MedicalDictionary;
        
        if(data.length !=0){
            MedicalDictionary   =   [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            MedicalTypechildren *clsMedicalChildren;
            ar_MedicalChildrens =[[NSMutableArray alloc ] init];
            
            if(![[MedicalDictionary description] isEqualToString:@"<null>"]){
                for(NSDictionary *item in MedicalDictionary)
                {

                    
                    clsMedicalChildren = [[MedicalTypechildren alloc ] initWithId:[item objectForKey:@"id"] Pid:[item objectForKey:@"ParentId"] Name:[item objectForKey:@"name"] quantiti:[NSString stringWithFormat:@"%ld",[[item objectForKey:@"quantiti"] integerValue]] MediaThwmbnail:[item objectForKey:@"MediaThwmbnail"] Description:[item objectForKey:@"Description"] price:[NSString stringWithFormat:@"%ld",[[item objectForKey:@"price"] integerValue]]];
                    
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

@end
