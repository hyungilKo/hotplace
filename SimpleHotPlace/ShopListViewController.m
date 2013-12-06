//
//  ShopListViewController.m
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 11. 25..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import "ShopListViewController.h"
#import "ShopInfoDetailController.h"
#import "ShopInfo.h"
#import "SimpleImageModel.h"
#import "Global.h"

@interface ShopListViewController ()

@end

@implementation ShopListViewController

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
    
	_shopGroups = [NSMutableArray arrayWithCapacity:0];
    
    [self fetchReceiveShopList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Table View shopGroups count:%ld", [_shopGroups count]);
    return [_shopGroups count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ShopInfoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSLog(@"Cell For Row At Index Path");
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    ShopInfo *shopInfo = [_shopGroups objectAtIndex:indexPath.row];
    
    UIImageView *shopImage = (UIImageView *)[cell viewWithTag:102];
    shopImage.image = [[SimpleImageModel sharedInstance] cashedIamgeForURL:[NSString stringWithFormat:@"http://devhotplace.kicc.co.kr:8090%@", shopInfo.merc_url]];
    
    
    UILabel *shopNameLabel = (UILabel *)[cell viewWithTag:100];
    shopNameLabel.text = shopInfo.merc_nm;
    
    UILabel *shopMentLabel = (UILabel*)[cell viewWithTag:101];
    shopMentLabel.text = shopInfo.merc_ment;
 
    return cell;
    
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{

    ShopInfo *shopInfo = [self.shopGroups objectAtIndex:indexPath.row];
    NSString  * merc_ment  = [NSString stringWithString:[shopInfo valueForKey:@"merc_ment"]];
    CGSize  withinSize     = CGSizeMake(255, CGFLOAT_MAX);
    CGSize  size           = [merc_ment sizeWithFont:[UIFont systemFontOfSize:14]
                              constrainedToSize:withinSize
                                       lineBreakMode:UILineBreakModeWordWrap];
    return size.height + 50.0;
}
*/

-(void) fetchReceiveShopList
{
    
    NSString *urlString = [NSString stringWithFormat:@"http://devhotplace.kicc.co.kr:8090/inf/listhead/ListMainAction.do?biz_top_cd=1&biz_med_cd=000&latitude=37.482118&longitude=126.883905&language_gubun=1&time_gubun=0&area_yn=N&distance=500&area_gb=0&area_id=83&sch_gb=2&hotservice_yn=A&hotmenu_yn=Y&stmp_yn=&trs_yn=Y&aos_yn=Y&deal_yn=Y"];
    NSURL *url = [NSURL URLWithString:urlString];
 
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
 //           [self fetchingGroupsFailedWithError:error];
        } else {
            
            NSError *localError = nil;
            NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&localError];
            
            if (localError != nil) {
                error = localError;
                return;
            }
            
 //           _shopGroups = [[NSMutableArray alloc] init];
            
            NSArray *results = [parsedObject valueForKey:@"merc_list"];
            NSLog(@"Count %lu", (unsigned long)results.count);
            
            if(results != nil)
            {
                [_shopGroups removeAllObjects];
            }
            else
            {
                return;
            }
            
            for (NSDictionary *groupDic in results) {
                ShopInfo *shopInfo = [[ShopInfo alloc] init];
                
                for (NSString *key in groupDic) {
                    if ([shopInfo respondsToSelector:NSSelectorFromString(key)]) {
                        [shopInfo setValue:[groupDic valueForKey:key] forKey:key];
                    }
                }
                
                [_shopGroups addObject:shopInfo];
            }
            
            NSLog(@"shopGroups Count %lu", (unsigned long)_shopGroups.count);
            
            [gValues setShopPOI:parsedObject];
            
            // API 실행 이후 화면 갱신을 위해 해당 메소드를 호출해준다
            [self performSelectorOnMainThread:@selector(didFinishFetching:) withObject:nil waitUntilDone:NO];
            
            for (int i = 0; i < _shopGroups.count; i++)
            {
                ShopInfo *shopInfo = [_shopGroups objectAtIndex:i];
                NSLog(@"shopInfo:%@", shopInfo.merc_nm);
            }
            
//            return groups;

            
        }
    }];
}


- (void)didFinishFetching:(NSArray *)result
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    [self.shopListTableView reloadData];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        ShopInfoDetailController * ShopInfoDetailController;
        
        NSIndexPath *indexPath = [self.shopListTableView indexPathForSelectedRow];
    
        NSDate *object = [_shopGroups objectAtIndex:indexPath.row];
    
        ShopInfoDetailController = segue.destinationViewController;
        [ShopInfoDetailController setDetailItem:object];
    }
}



@end
