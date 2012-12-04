//
//  MainSearchViewController.m
//  CraigApp
//
//  Created by Darshan Desai on 10/29/12.
//
//

#import "MainSearchViewController.h"
#import "CraigAppAppDelegate.h"

@interface MainSearchViewController ()

@end

@implementation MainSearchViewController

//Data Model 
DataModel *dataModel;

@synthesize priceMax, priceMin, keyword, bedMin, hasImage, appTitle, bedTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

// Sends the request to the Craigslist
// Gets the results
// Puts the results in the DataModel in NSData format
- (IBAction) searchCL:(id)sender {
    
    //NSString *testString = [NSString stringWithFormat:@"http://sfbay.craigslist.org/search/apa/eby?query=&srchType=A&minAsk=&maxAsk=&bedrooms=&nh=54&format=rss"];

    NSString *localKeyword = @"";
    NSString *minPrice = @"";
    NSString *maxPrice = @"";
    NSString *minBed = @"";
    NSString *hasPic = @"";
    NSString *metro = @"";
    NSString *clCategory = @"";
    
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

    metro = [[dataModel currentLocation] codeName];
    clCategory = [[dataModel currentCategory] codeName];

    NSString *s1 = [NSString stringWithFormat:@"http://%@.craigslist.org/search/%@?query=%@&srchType=A&minAsk=%@&maxAsk=%@&bedrooms=%@&hasPic=%@&format=rss", metro, clCategory, localKeyword, minPrice, maxPrice, minBed, hasPic];
    
    NSString *searchString = [s1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //NSString *searchString = [NSString stringWithUTF8String:[s1 UTF8String]];
    NSLog (@"%@", searchString);
    
    NSURL *url = [NSURL URLWithString:searchString];

    NSError *myerror = nil;
    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&myerror];

    //Assign the obtained data results to listingResults in Data Model
    dataModel.listingResults = data;

    if (myerror) {
        NSLog(@"%@", [myerror localizedDescription]);
    } else {
        NSLog(@"Data has loaded successfully.");
    }
}

// Dismiss the Keyboard when clicked on RETURN
- (IBAction) dismissKeyboard:(id)sender
{
    [sender resignFirstResponder];
}

// Dismiss the keyboard when clicked on outside of the keyboard
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

    // Obtain the Data Model from the App Delegate
    dataModel = [(CraigAppAppDelegate *)[[UIApplication sharedApplication] delegate] data];
    [self viewControlBasedOnSearchType];
}

// This method controls the View based on the Search Type
// For Housing Search Type, it displays # of beds otherwise not
// Also changes the title of the screen based on the type
- (void) viewControlBasedOnSearchType
{
    BOOL hideBed = YES;
    switch([dataModel currentCategory].searchType)
    {
        case SEARCH_HOUSING:
            self.title = @"ISA for Housing";
            hideBed = NO;
            break;
        case SEARCH_FORSALE:
            self.title = @"ISA for Sale";
            break;
        case SEARCH_GIGS:
            self.title = @"ISA for Gigs";
            break;
        case SEARCH_COMMUNITY:
            self.title = @"ISA for Community";
            break;
        case SEARCH_SERVICES:
            self.title = @"ISA for Services";
            break;
        case SEARCH_RESUME:
            self.title = @"ISA for Resume";
            break;
        default:
            break;
    }
    [bedTitle setHidden:hideBed];
    [bedMin setHidden:hideBed];
    appTitle.text = [[dataModel currentCategory] name];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
