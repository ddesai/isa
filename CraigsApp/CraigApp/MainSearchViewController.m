//
//  MainSearchViewController.m
//  CraigApp
//
//  Created by Darshan Desai on 10/29/12.
//
//

#import "MainSearchViewController.h"

@interface MainSearchViewController ()


@end

@implementation MainSearchViewController

@synthesize priceMax, priceMin, keyword, bedMin, hasImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction) searchCL:(id)sender {
    
    //NSString *testString = [NSString stringWithFormat:@"http://sfbay.craigslist.org/search/apa/eby?query=&srchType=A&minAsk=&maxAsk=&bedrooms=&nh=54&format=rss"];

    NSString *localKeyword = @"";
    NSString *minPrice = @"";
    NSString *maxPrice = @"";
    NSString *minBed = @"";
    NSString *hasPic = @"";
    
    if([keyword.text length])
        localKeyword = keyword.text;

    if([priceMin.text length])
        minPrice = priceMin.text;

    if([priceMax.text length])
        maxPrice = priceMax.text;

    if([bedMin.text length])
        minBed = bedMin.text;

    if(hasImage.on)
        hasPic=@"1";
    
    NSString *s1 = [NSString stringWithFormat:@"http://sfbay.craigslist.org/search/apa/eby?query=%@&srchType=A&minAsk=%@&maxAsk=%@&bedrooms=%@&hasPic=%@&nh=54&format=rss", localKeyword, minPrice, maxPrice, minBed, hasPic];
    
    NSString *searchString = [s1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //NSString *searchString = [NSString stringWithUTF8String:[s1 UTF8String]];
    NSLog (@"%@", searchString);
    
    NSURL *url = [NSURL URLWithString:searchString];

    NSError *myerror = nil;
    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&myerror];

    if (myerror) {
        NSLog(@"%@", [myerror localizedDescription]);
    } else {
        NSLog(@"Data has loaded successfully.");
    }
    
    NSString *strData = [[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
    
    NSLog(@"My Data: %@", strData);
    NSXMLParser *xmlParser = [[NSXMLParser alloc]initWithData:data];
    
    [xmlParser parse];
    
    //[[UIApplication sharedApplication] openURL:url];
    
    /*
    NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSArray *resultArray = [results objectForKey:@"rdf"];
    
    NSDictionary *firstItem = [resultArray objectAtIndex:0];
    
    NSNumber *elevation = [firstItem objectForKey:@"elevation"];
    */
}

- (IBAction) dismissKeyboard:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction) dismissKeyboardOutside:(id)sender
{
    [priceMax resignFirstResponder];
    [priceMin resignFirstResponder];
    [bedMin resignFirstResponder];
    [keyword resignFirstResponder];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
