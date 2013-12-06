//
//  ShopInfo.m
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 11. 26..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import "ShopInfo.h"

@implementation ShopInfo

@end

@implementation LSLocation
@synthesize annotationImage;

- (CLLocationCoordinate2D) coordinate
{
    CLLocationCoordinate2D theCoordiante = CLLocationCoordinate2DMake(_latitude, _longitude);
    return theCoordiante;
}

- (UIImage *)annotationImage
{
    if (annotationImage == nil)
    {
        NSString *imagePath  = [[NSBundle mainBundle] pathForResource:@"restaurant_annotation" ofType:@"png"];
        annotationImage = [[UIImage alloc] initWithContentsOfFile:imagePath];
    }
    
    return annotationImage;
}

@end

@implementation ShopInfoDetail

@end