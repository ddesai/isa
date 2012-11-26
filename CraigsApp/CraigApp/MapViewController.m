//
//  MapViewController.m
//  CraigApp
//
//  Created by Darshan Desai on 10/30/12.
//
//

#import "MapViewController.h"
#import "ISAMapPoint.h"

@implementation MapViewController

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
    
    // Annotates the map using the addresses
    [self annotateMap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 1) Gets the address in the argument
// 2) Queries the Google GEOCODE APIs to obtain the latitude and longitude of the address
// 3) Uses JSON to parse the results from the Google API REST web service results response
// 4) Returns the lat and lng in the CLLocationCoordinate2D object
- (CLLocationCoordinate2D) getCoordinatesFromGoogle:(NSString*) address
{
    NSString *urlPrefix = @"http://maps.googleapis.com/maps/api/geocode/json?address=";
    NSString *urlStringASCII = [NSString stringWithFormat:@"%@%@&sensor=false",urlPrefix, address];
    NSString* urlString = [urlStringASCII
                           stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *myerror = nil;
    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&myerror];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data //1
                                                         options:kNilOptions
                                                           error:&myerror];
    if (myerror) {
        NSLog(@"%@", [myerror localizedDescription]);
    } else {
        NSLog(@"Data has loaded successfully.");
    }
    
    NSString *status = [json objectForKey:@"status"];
    NSLog(@"JSON Parsing Status: %@", status);
    
    NSArray* resultsArray = [json objectForKey:@"results"];
    NSDictionary *firstItem = [resultsArray objectAtIndex:0];
    //NSString *formattedAddress = [firstItem objectForKey:@"formatted_address"];
    NSDictionary *geometryDict = [firstItem objectForKey:@"geometry"];
    NSNumber *latitude = [[geometryDict objectForKey:@"location"] objectForKey:@"lat"];
    NSNumber *longitude = [[geometryDict objectForKey:@"location"] objectForKey:@"lng"];
    
    CLLocation *location = [[CLLocation alloc]
                            initWithLatitude:[latitude doubleValue]
                            longitude:[longitude doubleValue]];
    
    //NSLog(@"Formatted Address: %@", formattedAddress);
    //NSLog(@"Geometry: %@", [geometryDict objectForKey:@"location"]);
    return location.coordinate;
}


// annotate Map with Map Points
// Later this code needs to be modified to get an array of ISAMapPoints from DataModel and populate the map
- (void) annotateMap
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation = [self getCoordinatesFromGoogle:@"120 Hackamore Ln, Fremont, CA"];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 8*METERS_PER_MILE, 8*METERS_PER_MILE);
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    [_mapView setRegion:adjustedRegion animated:YES];
    
    NSString *address1 = @"55 Hackamore Ln, Fremont, CA 94539";
    NSString *address2 = @"34775 Bowie Cmn, Fremont, CA 94555";
    NSString *address3 = @"110 Hackamore Ln, Fremont, CA 94539";

    ISAMapPoint *annotation;
    annotation = [[ISAMapPoint alloc] initWithName:@"Address1" address:address1
                                        coordinate:[self getCoordinatesFromGoogle:address1]];
    [_mapView addAnnotation:annotation];
    
    annotation = [[ISAMapPoint alloc] initWithName:@"Address2" address:address2
                                        coordinate:[self getCoordinatesFromGoogle:address2]];
    [_mapView addAnnotation:annotation];
    
    annotation = [[ISAMapPoint alloc] initWithName:@"Address3" address:address3
                                        coordinate:[self getCoordinatesFromGoogle:address3]];
    [_mapView addAnnotation:annotation];
}


/*
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MyLocation";
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.image=[UIImage imageNamed:@"checked.png"];//here we use a nice image instead of the default pins
        
        return annotationView;
    }
    
    return nil;    
}

- (void)mapView:(MKMapView *)mv didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D userCoordinate = userLocation.location.coordinate;
    for(int i = 1; i<=5;i++)
    {
        CGFloat latDelta = rand()*.035/RAND_MAX -.02;
        CGFloat longDelta = rand()*.03/RAND_MAX -.015;
        CLLocationCoordinate2D newCoord = { userCoordinate.latitude + latDelta, userCoordinate.longitude + longDelta };
        ISAMapPoint *mp = [[ISAMapPoint alloc] initWithName:@"test2" address:@"HomeTest2" coordinate:newCoord];
        [mv addAnnotation:mp];
        //[mp release];
    }
}
*/

@end
