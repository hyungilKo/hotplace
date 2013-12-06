//
//  ShopListViewController.h
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 11. 25..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
 
}

@property (nonatomic, strong)   NSMutableArray *shopGroups;
@property (weak, nonatomic) IBOutlet UITableView *shopListTableView;
@property (weak, nonatomic) IBOutlet UILabel *shopName;

@end
