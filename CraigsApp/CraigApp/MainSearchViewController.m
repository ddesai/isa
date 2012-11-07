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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction) searchCL:(id)sender {
    
    NSString *testString = [NSString stringWithFormat:@"http://sfbay.craigslist.org/search/apa/eby?query=&srchType=A&minAsk=&maxAsk=&bedrooms=&nh=54&format=rss"];
    
    NSLog (@"%@", testString);
    
    NSURL *url = [NSURL URLWithString:testString];
    
    NSString *clPath = [url absoluteString];

    NSLog (@"\nPATH:-- %@", clPath);
    
    NSError *myerror = nil;
    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&myerror];
    
    if (myerror) {
        NSLog(@"%@", [myerror localizedDescription]);
    } else {
        NSLog(@"Data has loaded successfully.");
    }
    
    NSString *strData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSXMLParser *xmlParser = [[NSXMLParser alloc]initWithData:data];
    
    [xmlParser parse];
    
    //NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    //NSArray *resultArray = [results valueForKey:@"results"];
    
    //NSDictionary *firstItem = [resultArray objectAtIndex:0];
    
    //NSNumber *elevation = [firstItem objectForKey:@"elevation"];
    
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
