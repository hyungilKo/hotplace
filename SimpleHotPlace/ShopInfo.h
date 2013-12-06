//
//  ShopInfo.h
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 11. 26..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface LSLocation : NSObject <MKAnnotation>
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (copy) NSString *location;
@property (strong, readonly) NSString *addressOfLocation;
@property CLLocationDegrees longitude;
@property CLLocationDegrees latitude;
@property (strong, readonly) UIImage *annotationImage;
@property (readonly) int distance;
@property (strong, readonly) NSString *distanceString;
@property (nonatomic, copy) NSString *shopType;
@property (nonatomic, copy) NSString *shopDetailType;
@end


@interface ShopInfo : NSObject
@property (nonatomic)         NSInteger  nIndex;
@property (strong, nonatomic) NSString *rank_no;
@property (strong, nonatomic) NSString *merc_mid;
@property (strong, nonatomic) NSString *merc_url;
@property (strong, nonatomic) NSString *merc_nm;
@property (strong, nonatomic) NSString *merc_ment;
@property (strong, nonatomic) NSString *biz_top_nm;
@property (strong, nonatomic) NSString *biz_med_nm;
@property (strong, nonatomic) NSString *biz_med_cd;
@property (strong, nonatomic) NSString *distance;
@property (strong, nonatomic) NSString *merc_grade;
@property (strong, nonatomic) NSString *cnt_amount;
@property (strong, nonatomic) NSString *avg_star;
@property (strong, nonatomic) NSString *like_cnt;
@property (strong, nonatomic) NSString *review_cnt;
@property (strong, nonatomic) NSString *area_name;
@property (strong, nonatomic) NSString *pos_head_cd;
@property (strong, nonatomic) NSString *pos_merc_cd;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *hotmenu_yn;
@property (strong, nonatomic) NSString *deal_yn;
@property (strong, nonatomic) NSString *stmp_yn;
@property (strong, nonatomic) NSString *trs_yn;
@property (strong, nonatomic) NSString *aos_yn;
@end



@interface ShopInfoDetail : NSObject
@property (strong, nonatomic) NSString *rest_code  ;
@property (strong, nonatomic) NSString *mhr_mid    ;
@property (strong, nonatomic) NSString *pos_head_cd;
@property (strong, nonatomic) NSString *pos_mer_cd ;
@property (strong, nonatomic) NSString *hot_menu_yn;
@property (strong, nonatomic) NSString *merc_nm    ;
@property (strong, nonatomic) NSString *merc_img_url;
@property (strong, nonatomic) NSString *avg_star   ;
@property (strong, nonatomic) NSString *rater_cnt  ;
@property (strong, nonatomic) NSString *like_cnt   ;
@property (strong, nonatomic) NSString *like_yn    ;
@property (strong, nonatomic) NSString *biz_top_nm ;
@property (strong, nonatomic) NSString *biz_med_nm ;
@property (strong, nonatomic) NSString *biz_med_cd ;
@property (strong, nonatomic) NSString *merc_ment  ;
@property (strong, nonatomic) NSString *phone_num  ;
@property (strong, nonatomic) NSString *img_cnt    ;
@property (strong, nonatomic) NSString *rcmd_ment_cnt;
@property (strong, nonatomic) NSString *qna_cnt    ;
@property (strong, nonatomic) NSString *deal_cnt   ;
@property (strong, nonatomic) NSString *review_cnt ;
@property (strong, nonatomic) NSString *bas_addr   ;
@property (strong, nonatomic) NSString *dtl_addr   ;
@property (strong, nonatomic) NSString *hompg_addr ;
@property (strong, nonatomic) NSString *holiday    ;
@property (strong, nonatomic) NSString *rsv_grp_yn ;
@property (strong, nonatomic) NSString *smok_yn    ;
@property (strong, nonatomic) NSString *parking_yn ;
@property (strong, nonatomic) NSString *deliv_yn   ;
@property (strong, nonatomic) NSString *trans_yn   ;
@property (strong, nonatomic) NSString *wifi_yn    ;
@property (strong, nonatomic) NSString *pet_yn     ;
@property (strong, nonatomic) NSString *playroom_yn;
@property (strong, nonatomic) NSString *toilet_yn  ;
@property (strong, nonatomic) NSString *credit_yn  ;
@property (strong, nonatomic) NSString *cash_yn    ;
@property (strong, nonatomic) NSString *point_yn   ;
@property (strong, nonatomic) NSString *minor_yn   ;
@property (strong, nonatomic) NSString *franch_id  ;
@property (strong, nonatomic) NSString *latitude   ;
@property (strong, nonatomic) NSString *longitude  ;
@property (strong, nonatomic) NSString *area_name  ;
@property (strong, nonatomic) NSString *merc_grade ;
@property (strong, nonatomic) NSString *cnt_amount ;
@property (strong, nonatomic) NSString *stmp_yn    ;
@property (strong, nonatomic) NSString *trs_yn     ;
@property (strong, nonatomic) NSString *aos_yn     ;
@property (strong, nonatomic) NSString *service_cnt;
@property (strong, nonatomic) NSString *remain_cnt ;
@property (strong, nonatomic) NSString *stmp_ment  ;
@property (strong, nonatomic) NSMutableDictionary *img_list;
@property (strong, nonatomic) NSMutableDictionary *deal_list;
@property (strong, nonatomic) NSMutableDictionary *rcmd_menu_list;
@property (strong, nonatomic) NSMutableDictionary *review_list;
@property (strong, nonatomic) NSMutableDictionary *qna_list;
@property (strong, nonatomic) NSMutableDictionary *sale_tm_list;
@end