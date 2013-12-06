//
//  ShopInfoDetailSubFirstViewController.m
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 11. 29..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import "ShopInfoDetailSubFirstViewController.h"
#import "SimpleImageModel.h"

@interface ShopInfoDetailSubFirstViewController ()

@end

@implementation ShopInfoDetailSubFirstViewController

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
    NSLog(@"DELEGATE FIRST");
    

}

-(void) reloadData:(NSDictionary *) shopInfoObejct
{
    NSLog(@"Reload FirstSubView");
    
    _shopName.text = @"";
    _shopMent.text = @"";
    
    _shopName.text = [shopInfoObejct valueForKey:@"merc_nm"];
    _shopMent.text = [shopInfoObejct valueForKey:@"merc_ment"];
    [_telNo setTitle:[shopInfoObejct valueForKey:@"phone_num"] forState:UIControlStateNormal];
    
    _shopImage.image = [[SimpleImageModel sharedInstance] cashedIamgeForURL:[NSString stringWithFormat:@"http://devhotplace.kicc.co.kr:8090%@", [shopInfoObejct valueForKey:@"merc_img_url"]]];
    
/*
 UIImageView *shopImage = (UIImageView *)[cell viewWithTag:102];
 shopImage.image = [[SimpleImageModel sharedInstance] cashedIamgeForURL:[NSString stringWithFormat:@"http://devhotplace.kicc.co.kr:8090%@", shopInfo.merc_url]];
 
 
 */
    
}


@end
