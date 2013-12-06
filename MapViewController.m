//
//  MapViewController.m
//  SimpleHotPlace
//
//  Created by Hyungil Ko on 2013. 12. 3..
//  Copyright (c) 2013년 Kicc. All rights reserved.
//

#import "MapViewController.h"
#import "Global.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView;


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
	// Do any additional setup after loading the view.
}


- (void) viewDidAppear:(BOOL)animated
{
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(37.482, 126.884);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.003, 0.003);
    MKCoordinateRegion initialRegin = MKCoordinateRegionMake(center, span);
    
    self.mapView.region = initialRegin;
    [self poiUpdate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) poiUpdate
{
//    [self.mapView removeAnnotation:self.mapView.annotations];
    [self.mapView addAnnotations:gValues.shopPOI];
    
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    static NSString *LocationAnnotationIdentifier =@"Custom";
  
    MKAnnotationView * anotationView  = [self.mapView dequeueReusableAnnotationViewWithIdentifier:LocationAnnotationIdentifier];
    
    if (!anotationView)
    {
        MKAnnotationView * customAnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:LocationAnnotationIdentifier];
        customAnnotationView.centerOffset = CGPointMake(0, -10);
        customAnnotationView.canShowCallout = YES;
        customAnnotationView.image = [(LSLocation *)annotation annotationImage];
        UIButton *rightDetailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        customAnnotationView.rightCalloutAccessoryView = rightDetailButton;
        
        return customAnnotationView;
        
    }
    else
    {
        anotationView.annotation = annotation;
    }
    
    return anotationView;
    
}


- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    MKAnnotationView *annotationView;
    float animationDelay = 0.0;
    for (annotationView in views) {
        CGRect endFrame = annotationView.frame;
      
       NSLog(@"ANNOTATION");
        annotationView.frame = CGRectMake(annotationView.frame.origin.x, annotationView.frame.origin.y - 100.0, annotationView.frame.size.width, annotationView.frame.size.height);
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationDelay:animationDelay];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [annotationView setFrame:endFrame];
        [UIView commitAnimations];
        animationDelay = animationDelay + 0.02;
    }
}


@end
