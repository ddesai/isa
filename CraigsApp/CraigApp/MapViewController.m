//
//  MapViewController.m
//  CraigApp
//
//  Created by Darshan Desai on 10/30/12.
//
//

#import "MapViewController.h"

@interface MapViewController ()

@end

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
    
    NSString *url = @"https://google-developers.appspot.com/maps/documentation/javascript/examples/map-geolocation";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [map loadRequest:request]; // use [self loadrequest:request] if entire view is a webView?
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
