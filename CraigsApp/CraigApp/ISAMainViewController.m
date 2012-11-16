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

CraigAppAppDelegate* appDelegate;

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
	// Do any additional setup after loading the view.
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
    // Return the number of rows in the section.
    appDelegate = (CraigAppAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //return [[appDelegate data] numberOfSections];
    return 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
#import "DataModel.h"
    DataModel *dataModel;
    dataModel = [appDelegate data];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    

    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // For the first time, it initializes it to these values
    // Later, after I change the data model to use object, this code will change
    if([dataModel currentSection] == -1) {
        cell.textLabel.text = [dataModel getSectionAtIndex:[indexPath row]];
        NSString *selectedText = @" ";
        switch ([indexPath row])
        {
            case 1: selectedText = @"SF Bay Area"; break;
            case 0: selectedText = @"Apt Rental"; break;
            default: selectedText = @" ";
        }
        cell.detailTextLabel.text = selectedText;
    }
    // Makes sure that we only update the changed item
    else {
        if([dataModel currentSection] == [indexPath row])
            cell.detailTextLabel.text = [dataModel test];
    }
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataModel *data;
    appDelegate = (CraigAppAppDelegate *)[[UIApplication sharedApplication] delegate];
    data = [appDelegate data];
    [data setCurrentSection:[indexPath row]];
    
    SearchDetailViewController *ivc = [[SearchDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
    ivc.searchDelegate = self;
    
    //ivc.title = [[data getSectionAtIndex:[indexPath row]]];
    //ivc.items = [[library getCategoryAtIndex:[indexPath row]] getMembers];
    //[self pushViewController:ivc animated:YES];
    [self.navigationController pushViewController:ivc animated:YES];
}

@end
