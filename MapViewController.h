//
//  MapViewController.h
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 12. 3..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>


@interface MapViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
