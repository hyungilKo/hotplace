//
//  ShopInfoDetailSubThirdViewController.m
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 12. 2..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import "ShopInfoDetailSubThirdViewController.h"

@interface ShopInfoDetailSubThirdViewController ()

@end

@implementation ShopInfoDetailSubThirdViewController

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
    NSLog(@"@ShopInfoDetailSubThirdViewController!!!!!!!!!!!!!!!!!!!!!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) reloadData:(NSDictionary *) shopInfoObejct
{
    NSLog(@"Reload ThirdSubView");
}


@end
