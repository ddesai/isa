//
//  DetailViewController.m
//  ISA
//
//  Created by Hayley Wu on 11/25/12.
//
//

#import "DetailViewController.h"


@implementation DetailViewController;

@synthesize listingUrl, detailListing;


- (id)initWithString:(NSString *)urlString{
    self = [super init];
    if (self != nil)
    {
        self.listingUrl = urlString;

    }
    return self;
}



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

    NSURL *url = [NSURL URLWithString:self.listingUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [self.detailListing loadRequest:request];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
