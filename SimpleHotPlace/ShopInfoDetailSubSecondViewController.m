//
//  ShopInfoDetailSubSecondViewController.m
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 12. 2..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import "ShopInfoDetailSubSecondViewController.h"

@interface ShopInfoDetailSubSecondViewController ()

@end

@implementation ShopInfoDetailSubSecondViewController

@synthesize shopInfoDetail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    shopInfoDetail.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) shopInfoDetailLoad:(NSDictionary *) obejct
{
    NSLog(@"DELEGATE SECOND");
}

-(void) reloadData:(NSDictionary *) shopInfoObejct
{
    NSLog(@"Reload SecondSubView");
}

@end
