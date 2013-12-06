//
//  SimpleImageModel.m
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 11. 26..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import "SimpleImageModel.h"

@implementation SimpleImageModel

@synthesize operationQueue;
@synthesize cashedImages;

-(id)init {
    if (self = [super init])
    {
        self.operationQueue = [[NSOperationQueue alloc] init];
        [self.operationQueue setMaxConcurrentOperationCount:10];
        self.cashedImages   = [NSMutableDictionary dictionaryWithCapacity:10];
        
    }
    
    return self;
}

-(UIImage *) cashedIamgeForURL:(NSString *)url{
    id cashedObejct = nil;
    
    if (url == nil)
    {
        return nil;
    }
    
    cashedObejct = [self.cashedImages objectForKey:url];
    
    if ([cashedObejct isKindOfClass:[NSData class]])
    {
        cashedObejct = [UIImage imageWithData:cashedObejct];
    }
    else{
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
        UIImage *image = [[UIImage alloc] initWithData:data];
        
        if (image == nil)
        {
            return nil;
        }
        
        [self.cashedImages setObject:UIImagePNGRepresentation(image) forKey:url];
        
        cashedObejct = image;
        
    }
    
    return cashedObejct;
    
}


+ (SimpleImageModel *)sharedInstance
{
    static  SimpleImageModel *instance = nil;
    
    @synchronized(self)
    {
        if (instance == nil)
        {
            instance = [[SimpleImageModel alloc] init];
        }
    }
    
    return instance;
}

@end
