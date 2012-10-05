//
//  ViewController.m
//  OSMKDemoApp
//
//  Created by rmurray on 04/10/2012.
//  Copyright (c) 2012 OrdnanceSurvey. All rights reserved.
//

#import "MapViewController.h"

#define kOS_API_KEY @"YOUR_KEY_HERE"
#define kOS_URL @"YOUR_URL_HERE"
#define kIS_PRO FALSE

@interface MapViewController () <MKMapViewDelegate>

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
#ifndef USE_MAPKIT
    // Configure tileSources
    id<OSTileSource> webSource = [OSMapView webTileSourceWithAPIKey:kOS_API_KEY refererUrl:kOS_URL openSpacePro:kIS_PRO];
    self.mapView.tileSources = [NSArray arrayWithObjects:webSource, nil];
    
#endif
    
    self.mapView.delegate = self;
    
    [self setMapDefaultLocation];//set region to gb
    
    [self addAnnotationForCoord:(CLLocationCoordinate2D){52.205298,0.118146}];//add coord for point

}

/*
 * Simple method to add annotation for a CLLocationCoordinate2D
 */
- (void)addAnnotationForCoord:(CLLocationCoordinate2D)coord
{
    
    MKPointAnnotation *annotation = [MKPointAnnotation new];
    [annotation setCoordinate:coord];
    
    annotation.title = @"Here my coordinate";
    annotation.subtitle = [NSString stringWithFormat:@"%0.4f,%0.4f",annotation.coordinate.latitude, annotation.coordinate.longitude];
    [self.mapView addAnnotation:annotation];
    
}

/*
 * Set default location
 */
- (void)setMapDefaultLocation
{
    // go to the GB
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 54;
    newRegion.center.longitude = -1.5;
    newRegion.span.latitudeDelta = 8;
    newRegion.span.longitudeDelta = 7;
    [self.mapView setRegion:newRegion animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    self.mapView = nil;
}


#pragma mark Map View Delegate methods

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // Use the default user location view.
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    MKPinAnnotationView *view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    view.animatesDrop = YES;
    view.canShowCallout = YES;
    view.draggable = NO;
    return view;
}


@end
