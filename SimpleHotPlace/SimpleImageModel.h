//
//  SimpleImageModel.h
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 11. 26..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleImageModel : NSObject {
    //스레드 큐
    NSOperationQueue *operationQueue;
    //사용자 프로파일 이미지들을 저장하고 있는 캐쉬
    NSMutableDictionary *cashedImages;
}

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) NSMutableDictionary *cashedImages;

+(SimpleImageModel *) sharedInstance;
-(UIImage *)          cashedIamgeForURL:(NSString *)url;


@end
