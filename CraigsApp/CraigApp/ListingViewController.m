//
//  ListingViewController.m
//  CraigApp
//
//  Created by Darshan Desai on 10/30/12.
//
//

#import "ListingViewController.h"
#import "CraigAppAppDelegate.h"
#import "GDataXMLNode.h"

DataModel *dataModel;

@implementation ListingViewController
{
    NSMutableArray *listingsUrl;
}

// comment out this method as storyboarded-custom cell with cell identifier will
// never return null, so this method is not needed (unless custom cells are
// programmatically created
/*- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Get the data model instance from AppDelegate
    dataModel = [(CraigAppAppDelegate *)[[UIApplication sharedApplication] delegate] data];
    if(listingsUrl && [listingsUrl count] > 0)
        [listingsUrl removeAllObjects];

    if([dataModel numberOfListings] > 0)
       [[dataModel listings] removeAllObjects];
    
    [self parseDocumentWithNSData:dataModel.listingResults];
    
    return listingsUrl.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Listing *l = [dataModel getListingAtIndex:indexPath.row];
    
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    
    
    // Cleanup title using regex
    NSError *error = NULL;
    NSRegularExpression *regex1 = [NSRegularExpression regularExpressionWithPattern:@"\\((.*)\\)" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSString *title1 = [regex1 stringByReplacingMatchesInString:l.title options:0 range:NSMakeRange(0, [l.title length]) withTemplate:@""];
    
    NSRegularExpression *regex2 = [NSRegularExpression regularExpressionWithPattern:@"\\$[0-9]+" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSString *title2 = [regex2 stringByReplacingMatchesInString:title1 options:0 range:NSMakeRange(0, [title1 length]) withTemplate:@""];
    
    
    NSLog(@"title %@", title2);
    
    cell.titleLabel.text = title2;
    
    switch([dataModel currentCategory].searchType)
    {
        case SEARCH_HOUSING:
            cell.label1.text = l.town;
            cell.label2.text = l.price;
            break;
        case SEARCH_FORSALE:
            cell.label1.text = l.town;
            cell.label2.text = l.price;
            break;
        case SEARCH_GIGS:
            cell.label1.text = l.town;
            cell.label2.text = l.price;
            break;
        case SEARCH_COMMUNITY:
            cell.label1.text = l.town;
            cell.label2.text = l.price;

            break;
        case SEARCH_SERVICES:
            cell.label1.text = l.town;
            //cell.label2.text = l.price;

            break;
        case SEARCH_RESUME:
            cell.label1.text = l.town;
            //cell.label2.text = l.price;
            break;
        default:
            break;
    }  // end switch

    
    // check if favorites items have been checked
	UIImage *favCheckedImage = [dataModel checkIfIndexIsFav:indexPath.row] ? [UIImage imageNamed:@"checked.png"] : [UIImage imageNamed:@"unchecked.png"];
	[cell.addToFavButton setImage:favCheckedImage forState:UIControlStateNormal];
    
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //TableCell *cell = (TableCell *)[tableView cellForRowAtIndexPath:indexPath];
    //[cell checkFav:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //BOOL favChecked = cell.favChecked;
    //if(favChecked){

        //[dataModel addToFavorites:[listingsUrl objectAtIndex:indexPath.row]];
    //}*/
}

-(void) addDataToFavorites:(int)row
{
    Listing *newMember = [dataModel getListingAtIndex:row];
    [dataModel addToFavorites:newMember];
    [dataModel addIndexToFavorites:row];
}


-(void)removeDataFromFavorites:(int)row
{
    Listing *oldMember = [dataModel getListingAtIndex:row];
    [dataModel removeFromFavorites:oldMember];
    [dataModel removeIndexFromFavorites:row];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIStoryboard *storyboard = self.storyboard;
    
    DetailViewController *dvc = [storyboard instantiateViewControllerWithIdentifier:@"detail"];
    dvc.listingUrl = [dataModel getListingUrlAtIndex:indexPath.row];
    [self.navigationController pushViewController:dvc animated:YES];
}


-(void) parseDocumentUsingDocParser:(NSData*)data {
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data
                                                           options:0 error:&error];
    if (doc != nil){
        [self parseSearchResults:doc];
        [dataModel fillFavoriteIndeces];
    }
    else
        NSLog(@"ERROR --  Could not parse the Craigslist Results");
}

-(void) parseSearchResults:(GDataXMLDocument*) doc {
    NSString *PRICE_REGX = @" \\$[0-9]+";
    NSString *BED_REGX = @" [0-9]bd";
    NSString *TOWN_REGX = @" \\((.*)\\) \\$";
    NSRange match;
    NSString *mTitle, *mUrl, *mPrice, *mTown, *mBed;
    
    NSArray *items = [doc.rootElement elementsForName:@"item"];
    for (GDataXMLElement *item in items) {
        // Title
        NSArray *titles = [item elementsForName:@"dc:title"];
        if (titles.count > 0) {
            GDataXMLElement *titleElement = (GDataXMLElement *) [titles objectAtIndex:0];
            NSString *title = titleElement.stringValue;
            NSLog(@"Title: %@", title);
            mTitle = title;

            // Gets the price
            match = [title rangeOfString: PRICE_REGX options:NSRegularExpressionSearch];
            if(!(match.location == NSNotFound)) {
                mPrice = [title substringWithRange: NSMakeRange (match.location+1, match.length-1)];
                NSLog (@"Price: ==%@==", mTitle);
            }
            
            // Gets the #of Beds
            match = [title rangeOfString: BED_REGX options:NSRegularExpressionSearch];
            if(!(match.location == NSNotFound)) {
                mBed = [title substringWithRange: NSMakeRange (match.location+1, match.length-1)];
                NSLog (@"Beds: ==%@==", mBed);
            }

            // Gets the Town
            match = [title rangeOfString: TOWN_REGX options:NSRegularExpressionSearch];
            if(!(match.location == NSNotFound)) {
                mTown = [title substringWithRange: NSMakeRange (match.location+2, match.length-5)];
                NSLog (@"Town: ==%@==", mTown);
            }
        };

        // Links
        NSArray *links = [item elementsForName:@"dc:source"];
        if (links.count > 0) {
            GDataXMLElement *link = (GDataXMLElement *) [links objectAtIndex:0];
            mUrl = link.stringValue;
            NSLog(@"URL: %@", mUrl);
        };
        
        // Adds the Listing in the Data Model
        Listing *l = [[Listing alloc] initListingWithTitle:mTitle andUrl:mUrl andCategory:[dataModel currentSection] andTown:mTown andPrice:mPrice andBed:mBed];
        [dataModel addSearchListing:l];
        
        if (!listingsUrl)
            listingsUrl = [[NSMutableArray alloc] init];
        
        [listingsUrl addObject:l.title];
    }
}


-(BOOL)parseDocumentWithNSData:(NSData *)data{
    if (data == nil)
        return NO;
    
    [self parseDocumentUsingDocParser:data];
    return YES;
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    //NSLog(@"didStartElement: %@", elementName);
  
    
    if (![elementName isEqualToString:@"rdf:li"])
        return;
    
    NSString * detailUrl = [attributeDict objectForKey:@"rdf:resource"];
    
    if (!listingsUrl)
        listingsUrl = [[NSMutableArray alloc] init];
    
    [listingsUrl addObject:detailUrl];
}

@end
