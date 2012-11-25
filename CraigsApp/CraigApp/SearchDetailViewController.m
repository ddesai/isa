//
//  SearchDetailViewController.m
//  CraigApp
//
//  Created by Darshan Desai on 10/29/12.
//
//

#import "SearchDetailViewController.h"
#import "CraigAppAppDelegate.h"
#import "DataModel.h"

@interface SearchDetailViewController ()

@end

@implementation SearchDetailViewController

//Data Model
DataModel *data;

//searchSelectionChangedDelegate
@synthesize searchDelegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(!data) {
        CraigAppAppDelegate* appDelegate;
        appDelegate = (CraigAppAppDelegate *)[[UIApplication sharedApplication] delegate];
        data = [appDelegate data];
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Returns the # of rows based on what type it is of
    switch ([data currentSection])
    {
        case SECTION_CATEGORY: return [data numberOfCategories];
        case SECTION_LOCATION: return [data numberOfLocations];
        //case 3: return [data numberOfNeighborhoods];
        //case 4: return [data numberOfTowns];
        default: return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell1";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // Depending on what the user selected from the ISAMainView, it renders the DetailView
    switch ([data currentSection])
    {
        // Categories
        case SECTION_CATEGORY:
            //cell.textLabel.text = [data getCategoryAtIndex:[indexPath row]];
            cell.textLabel.text = [data getCategoryNameAtIndex:[indexPath row]];
            break;
        
        // Locations
        case SECTION_LOCATION:
            //cell.textLabel.text = [data getRegionAtIndex:[indexPath row]];
            cell.textLabel.text = [data getLocationNameAtIndex:[indexPath row]];
            break;
        //case 2: cell.textLabel.text = [data getNeighborhoodAtIndex:[indexPath row]]; break;
        //case 3: cell.textLabel.text = [data getTownAtIndex:[indexPath row]]; break;
        default: cell.textLabel.text = @"Error";
    }
    
    return cell;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Depending on what user selected, it updates the Data Model with the selection
    NSString *selectedText = @" ";
    switch ([data currentSection])
    {
        // Categories
        case SECTION_CATEGORY:
            [data setCurrentCategory:[data getCategoryAtIndex:[indexPath row]]];
            selectedText = [[data currentCategory] name];
            break;
        
        // Locations
        case SECTION_LOCATION:
            [data setCurrentLocation:[data getLocationAtIndex:[indexPath row]]];
            selectedText = [[data currentLocation] name];
            break;
        //case 2: selectedText = [data getNeighborhoodAtIndex:[indexPath row]]; break;
        //case 3: selectedText = [data getTownAtIndex:[indexPath row]]; break;
        default: selectedText = @"Error";
    }
    data.test = selectedText;
    [searchDelegate searchCategoryChanged:selectedText];
}

@end
