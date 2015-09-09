//
//  Center.m
//  IOSExamples
//
//  Created by ali saleme on 1/24/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

#import "Center.h"

@interface Center ()

@end

@implementation Center

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationItem.hidesBackButton = YES;
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  //  UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"medicine41.png"]];
   // [self.view addSubview:backgroundView];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Login{
   // rejj=[[RegisterController alloc] initWithNibName:@"RegisterController" bundle:[NSBundle mainBundle]];
  //  rejj.view.frame = CGRectMake(0, 0, rejj.view.frame.size.width, rejj.view.frame.size.height);
  //  [self presentViewController:rejj animated:true completion:nil];
    
}


@end
