ios-sdk-demo-mapkit-conversion
==============================

A demo app using the iOS Openspace SDK as a drop in replacement for Apple Mapkit.

This project contains an example of how convert an application currently using Apple Mapkit by renaming symbols with the preprocessor.

See [Conversion steps](#conversion-steps) for details about converting and the two targets in this project.


![ScreenShot](https://github.com/OrdnanceSurvey/ios-sdk-demo-mapkit-conversion/raw/master/screenshot-mk.png "Screenshot of mapkit-conversion app")
![ScreenShot](https://github.com/OrdnanceSurvey/ios-sdk-demo-mapkit-conversion/raw/master/screenshot-os.png "Screenshot of mapkit-conversion OS app")


Getting started
---


#### Register for an OS OpenSpace API Key

Developers will need to register and obtain an API Key for one of the [OS OpenSpace services](http://www.ordnancesurvey.co.uk/oswebsite/web-services/os-openspace/) in order to access the web mapping source.

#### Clone project

<pre>
git clone https://github.com/OrdnanceSurvey/ios-sdk-demo-mapkit-conversion.git
</pre>

#### Download ordnancesurvey-ios-sdk

 - Download the latest ordnancesurvey-ios-sdk static framework from [https://github.com/OrdnanceSurvey/ordnancesurvey-ios-sdk/downloads](https://github.com/OrdnanceSurvey/ordnancesurvey-ios-sdk/downloads) 
 - Unzip into the project directory root
 <pre>
 $SRCROOT/StaticFrameworks
 </pre>
 

#### Update demo app with your API Key

Copy and paste the API Key and associated URL into the demo app

Note: if an OS OpenSpace Pro account then change kIS_PRO to TRUE

<pre>
//In MapViewController.m

#define kOS_API_KEY @"YOUR_KEY_HERE"
#define kOS_URL @"YOUR_URL_HERE"
#define kIS_PRO FALSE

</pre>

#### Build and run

Project can now be built and run.

- Select the OSMKDemoApp for Apple Mapkit version
- Select the OSMKDemoAppOS for the iOS Openspace SDK version

#### Conversion steps

The initial project was a basic demo using Apple Mapkit and Storyboards. To convert an existing Mapkit application:

1. If using storyboard or nib then replace the existing MKMapView with a UIView of class name OSMapView and add -ObjC to linker flags. TODO: require -objc only for nibs??
2. Rename symbols

<pre>
#import "OSMap/OSMap.h"

        #define MKAnnotation OSAnnotation
        #define MKPointAnnotation OSPointAnnotation
        #define MKUserLocation OSUserLocation
        #define MKMapViewDelegate OSMapViewDelegate
        #define MKMapView OSMapView
        #define MKAnnotationView OSAnnotationView
        #define MKPinAnnotationView OSPinAnnotationView
        #define MKOverlay OSOverlay
        #define MKOverlayView OSOverlayView
        #define MKCircle OSCircle
        #define MKCircleView OSCircleView
        #define MKPolygon OSPolygon
        #define MKPolygonView OSPolygonView
        #define MKPolyline OSPolyline
        #define MKPolylineView OSPolylineView
        #define MKOverlayPathView OSOverlayPathView
        #define MKPinAnnotationColor OSPinAnnotationColor
        #define MKPinAnnotationColorRed OSPinAnnotationColorRed
        #define MKPinAnnotationColorPurple OSPinAnnotationColorPurple
        #define MKAnnotationViewDragState OSAnnotationViewDragState
        #define MKCoordinateRegion OSCoordinateRegion
        #define MKCoordinateSpan OSCoordinateSpan
        #define MKUserTrackingMode OSUserTrackingMode
        #define MKUserTrackingModeNone OSUserTrackingModeNone
        #define MKUserTrackingModeFollow OSUserTrackingModeFollow
        #define MKUserTrackingModeFollowWithHeading OSUserTrackingModeFollowWithHeading

        #import "OSMap/OSMap+MapPointCompat.h"

        #define MKMapRect OSMapRect
        #define MKMapPoint OSMapPoint
 </pre>


All code using prefix MK will now be replaced, the only extra code required is that to configure your tile sources.

This demo project has two targets, the OSMKDemoApp target has a preprocessor macro USE_MAPKIT which allows you to switch back to Mapkit as below:

<pre>
#ifdef USE_MAPKIT // or #ifndef USE_MAPKIT
//do something
#endif
</pre>



License
-------

Some notes about license & use TODO