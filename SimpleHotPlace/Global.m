//
//  global.m
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 12. 3..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import "Global.h"
#import "ShopInfo.h"


extern Global * gValues;


@implementation Global

@synthesize shopGroupDic;
@synthesize shopInfoDic;
@synthesize shopPOI;


-(id)init {
    if (self = [super init])
    {
       
    }
    return self;
}

-(void)initVars
{
    
    
}

- (void)setShopPOI:(NSDictionary *)object
{
 
    NSArray * array;

    shopPOI = [[NSMutableArray alloc]initWithCapacity:100];
    
    array = [object valueForKey:@"merc_list"];
    
    int i = 0;

    for (NSDictionary *groupDic in array) {
        NSLog(@"SHOP ARRAY :[%d] ================================", i++);
        LSLocation * location = [[LSLocation alloc] init];
        location.title = [groupDic valueForKey:(@"merc_nm")];
        location.subtitle = [groupDic valueForKey:(@"merc_ment")];
        location.longitude = [[groupDic valueForKey:(@"longitude")] doubleValue];
        location.latitude  = [[groupDic valueForKey:(@"latitude")] doubleValue];
        location.shopType  = [groupDic valueForKey:@"biz_top_nm"];
        location.shopDetailType = [groupDic valueForKey:@"biz_med_cd"];
        
        [shopPOI addObject:location];
        NSLog(@"### %@", location.title);
    }
    
    NSInteger count = [shopPOI count];
    
    
    NSLog(@"setShopPOI");
    
}

+(Global *)getInst
{
    static  Global *instance = nil;
    
    @synchronized(self)
    {
        if (instance == nil)
        {
            instance = [[Global alloc] init];
        }
    }
    
    return instance;
}

@end
