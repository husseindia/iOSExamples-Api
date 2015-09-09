//
//  ChildViewController.m
//  IOSExamples
//
//  Created by ali saleme on 1/15/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Shared = [SherdClass getInstance];
    [self DownMedicalWithType];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return ar_MedicalChildrens.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse1" forIndexPath:indexPath];
    
    MedicalTypechildren *item;
    item = [ar_MedicalChildrens objectAtIndex:indexPath.row];
    
    
    
    
    // Configure the cell...
    
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
                    /*clsMedicalChildren = [[MedicalTypechildren alloc ] initwithId:[item objectForKey:@"id"] Pid:[item objectForKey:@"ParentId"] Name:[item objectForKey:@"name"] quantiti:[item objectForKey:@"quantiti"] MediaThwmbnail:[item objectForKey:@"MediaThwmbnail"] Description:[item objectForKey:@"Description"] price:[item objectForKey:@"price"]];*/
                    
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

@end
