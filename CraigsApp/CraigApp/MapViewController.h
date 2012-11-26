//
//  MapViewController.h
//  CraigApp
//
//  Created by Darshan Desai on 10/30/12.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
{

    
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
