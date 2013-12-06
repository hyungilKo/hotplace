//
//  ShopInfoDetailSubSecondViewController.h
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 12. 2..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopInfoDetailController.h"

@interface ShopInfoDetailSubSecondViewController : UIViewController <ShopInfoDetailLoadDelegate>
{
    ShopInfoDetailController *shopInfoDetail;
}

@property  (nonatomic, retain)ShopInfoDetailController *shopInfoDetail;

-(void) reloadData:(NSDictionary *) shopInfoObejct;

@end
