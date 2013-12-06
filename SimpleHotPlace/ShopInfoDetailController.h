//
//  DetailViewController.h
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 11. 25..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopInfo.h"

@protocol ShopInfoDetailLoadDelegate;

@interface ShopInfoDetailController : UIViewController <UIScrollViewDelegate>{
    id <ShopInfoDetailLoadDelegate> delegate;
    
    NSDictionary *parsedObject;

    id firstSubview;
    id secondSubview;
    id thirdSubview;
    id forthSubview;
}

@property (strong, nonatomic) NSDictionary *shopInfo;
@property (strong, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) id <ShopInfoDetailLoadDelegate> delegate;
@property (strong, nonatomic) NSDictionary *parsedObject;

- (void)setDetailItem:(id)newDetailItem;

@end


@protocol ShopInfoDetailLoadDelegate <NSObject>

@optional
-(void) shopInfoDetailLoad:(NSDictionary *) obejct;

@end
