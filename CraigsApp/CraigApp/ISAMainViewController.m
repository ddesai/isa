//
//  TestViewController.m
//  CraigApp
//
//  Created by Darshan Desai on 11/1/12.
//
//

#import "ISAMainViewController.h"
#import "CraigAppAppDelegate.h"
#import "SearchDetailViewController.h"
#import "DataModel.h"


@interface ISAMainViewController ()

@end

@implementation ISAMainViewController

DataModel *dataModel;

@synthesize myTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// searchSelectionChanged delegate method
- (void) searchCategoryChanged: (NSString*) data
{
    [self.myTableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Get a pointer to the data Model
    CraigAppAppDelegate* appDelegate = (CraigAppAppDelegate *)[[UIApplication sharedApplication] delegate];
    dataModel = [appDelegate data];
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (NSString*) parseSelection:(int) row
{
    NSString *selectedText = @" ";
    
    switch (row)
    {
        // Categories
        case SECTION_CATEGORY:
            selectedText = [[dataModel currentCategory] name];
            break;
            
        // Locations
        case SECTION_LOCATION:
            selectedText = [[dataModel currentLocation] name];
            break;
            
        default:
            selectedText = @" ";
            break;
    }
    return selectedText;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // For the first time, it initializes it to these values
    // Later, after I change the data model to use object, this code will change
    if([dataModel currentSection] == SECTION_INIT) {
        cell.textLabel.text = [dataModel getSectionAtIndex:[indexPath row]];
        cell.detailTextLabel.text = [self parseSelection:[indexPath row]];
    }
    // Makes sure that we only update the changed item
    else {
        if([dataModel currentSection] == [indexPath row])
            cell.detailTextLabel.text = [self parseSelection:[indexPath row]];
    }
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [dataModel setCurrentSection:[indexPath row]];
    
    SearchDetailViewController *ivc = [[SearchDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
    ivc.searchDelegate = self;
    
    //ivc.title = [[data getSectionAtIndex:[indexPath row]]];
    //ivc.items = [[library getCategoryAtIndex:[indexPath row]] getMembers];
    //[self pushViewController:ivc animated:YES];
    [self.navigationController pushViewController:ivc animated:YES];
}

@end
