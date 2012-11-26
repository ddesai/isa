//
//  ISAMapPoint.h
//  ISA
//
//  Created by Darshan Desai on 11/25/12.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface ISAMapPoint : NSObject <MKAnnotation> {
    NSString *_name;
    NSString *_address;
    CLLocationCoordinate2D _coordinate;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;

@end
