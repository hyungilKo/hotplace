//
//  global.h
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 12. 3..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShopInfo.h"

@interface Global : NSObject{
    NSDictionary    * shopGroupDic;
    NSDictionary    * shopInfoDic;
    NSMutableArray  * shopPOI;
}

@property (nonatomic, strong) NSDictionary *shopGroupDic;
@property (nonatomic, strong) NSDictionary *shopInfoDic;
@property (nonatomic, strong) NSMutableArray *shopPOI;

-(void)initVars;
-(void)setShopGroupDic:(NSDictionary *) shopGroupObject;
-(void)setShopInfoDic:(NSDictionary *)  shopObejct;
-(void)setShopPOI:(NSDictionary *) object;

+(Global *)getInst;
@end

Global * gValues;
