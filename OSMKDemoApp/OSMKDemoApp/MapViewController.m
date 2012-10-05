//
//  ViewController.m
//  OSMKDemoApp
//
//  Created by rmurray on 04/10/2012.
//  Copyright (c) 2012 OrdnanceSurvey. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () <MKMapViewDelegate>

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
#ifndef USE_MAPKIT
    // Configure tileSources
    id<OSTileSource> webSource = [OSMapView webTileSourceWithAPIKey:@"Airsource" refererUrl:@"file://" openSpacePro:true];
    self.mapView.tileSources = [NSArray arrayWithObjects:webSource, nil];
    self.mapView.delegate = self;
    
#endif
    
    [self setMapDefaultLocation];
}

- (void)setMapDefaultLocation
{
    // go to the UK
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

@end
