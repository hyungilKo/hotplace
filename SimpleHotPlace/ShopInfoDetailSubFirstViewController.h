//
//  ShopInfoDetailSubFirstViewController.h
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 11. 29..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopInfoDetailController.h"

@interface ShopInfoDetailSubFirstViewController : UIViewController <ShopInfoDetailLoadDelegate>
{
    ShopInfoDetailController *shopInfoDetail;
}

@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *shopMent;
@property (weak, nonatomic) IBOutlet UIButton *telNo;
@property (weak, nonatomic) IBOutlet UIImageView *shopImage;


@property  (nonatomic, retain)ShopInfoDetailController *shopInfoDetail;

-(void) reloadData:(NSDictionary *) shopInfoObject;

@end
