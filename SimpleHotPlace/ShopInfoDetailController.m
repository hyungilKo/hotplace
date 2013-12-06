//
//  DetailViewController.m
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 11. 25..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import "ShopInfoDetailController.h"
#import "ShopInfo.h"
#import "ShopInfoDetailSubFirstViewController.h"
#import "ShopInfoDetailSubSecondViewController.h"

@interface ShopInfoDetailController ()
- (void)configureView;
- (void)subViewSetting:(NSDictionary *) obejct;
@end

@implementation ShopInfoDetailController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (self.shopInfo != newDetailItem) {
        self.shopInfo = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
/*
    if (self.detailItem) {
        
        _shopInfo.merc_mid = [self.detailItem valueForKey:@"merc_mid"];
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
*/
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureView];
    
    [self fetchReceiveShopInfo];
}

- (void)viewWillAppear:(BOOL)animated;
{
    NSLog(@"@ShopInfoDetailController viewWillApper !!!!!!!!!!!!!!!!!!!!!");
}

- (void)viewDidAppear:(BOOL)animated
{
	// Do any additional setup after loading the view, typically from a nib.
    [self.detailScrollView setScrollEnabled:YES];
    [self.detailScrollView setContentSize:CGSizeMake(320, 1000)];
    [self.detailScrollView addSubview:_contentView];
    
    NSLog (@"%f, %f, %f, %f", _contentView.frame.origin.x, _contentView.frame.origin.y, _contentView.frame.size.width, _contentView.frame.size.height);
    
    _detailScrollView.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) fetchReceiveShopInfo
{
    
    NSString *urlString = [NSString stringWithFormat:@"http://devhotplace.kicc.co.kr:8090/inf/listdtl/ListDtlMainAction.do?mhr_mid=%@&user_id=aa@a.com&language_gubun=1", [self.shopInfo valueForKey:@"_merc_mid"] ];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            //           [self fetchingGroupsFailedWithError:error];
        } else {
            
            NSError *localError = nil;
            self.parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&localError];
            
            if (localError != nil) {
                error = localError;
                return;
            }
            
            //           _shopGroups = [[NSMutableArray alloc] init];
            
            NSString *resultCode = [self.parsedObject valueForKey:@"res_code"];
            
            if (resultCode == nil)
            {
                return;
            }
            
            
            if ([resultCode isEqualToString:@"0000"] == NO)
            {
                return;
            }
            
            // API 실행 이후 화면 갱신을 위해 해당 메소드를 호출해준다
            [self performSelectorOnMainThread:@selector(didFinishFetching:)  withObject:self.parsedObject waitUntilDone:NO];
            
        }
    }];
}


- (void)didFinishFetching:(NSDictionary *) parsedObject
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

    if ([self.delegate respondsToSelector:@selector(shopInfoDetailLoad:)])
    {
        [self.delegate shopInfoDetailLoad:self.parsedObject];
    }

    [firstSubview reloadData:self.parsedObject];
    [secondSubview reloadData:self.parsedObject];
    [thirdSubview reloadData:self.parsedObject];
    [forthSubview reloadData:self.parsedObject];

    
}

- (void)subViewSetting:(NSDictionary *) dicObejct
{
    NSLog(@"@ShopInfoDetailController!!!!!!!!!!!!!!!!!!!!!");
    NSLog(@"VIEW CONTROLLER %@", self.class);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showSubFirstView"])
    {
//        ShopInfoDetailSubFirstViewController * firstSubViewController = segue.destinationViewController;
//        firstSubViewController.shopInfoDetail = segue.sourceViewController;
        firstSubview = segue.destinationViewController;
    }

    if ([segue.identifier isEqualToString:@"showSubSecondView"])
    {
        secondSubview = segue.destinationViewController;
    }

    if ([segue.identifier isEqualToString:@"showSubThirdView"])
    {
        thirdSubview  = segue.destinationViewController;
    }

    if ([segue.identifier isEqualToString:@"showSubForthView"])
    {
        forthSubview = segue.destinationViewController;
    }

}


@end
