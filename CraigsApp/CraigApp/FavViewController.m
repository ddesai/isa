//
//  FavViewController.m
//  CraigApp
//
//  Created by Darshan Desai on 10/30/12.
//
//


#import "FavViewController.h"
#import "CraigAppAppDelegate.h"
//#import "DetailViewController.h"
@implementation FavViewController
{
   DataModel *dataModel;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
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
    dataModel = [(CraigAppAppDelegate *)[[UIApplication sharedApplication] delegate] data];
    return dataModel.favorites.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row  = [indexPath indexAtPosition:indexPath.row];
    Listing *l = [dataModel getFavoriteAtIndex:row];
    
    FavCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FAVCELL"];
    
    
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
            //cell.label2.text = l.price;
            break;
        case SEARCH_COMMUNITY:
            cell.label1.text = l.town;
            //cell.label2.text = l.price;
            
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
    
    
    return cell;

}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row  = [indexPath indexAtPosition:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIStoryboard *storyboard = self.storyboard;
    
    DetailViewController *dvc = [storyboard instantiateViewControllerWithIdentifier:@"detail"];
    dvc.listingUrl = [dataModel getFAvoritesUrlAtIndex:row];
    [self.navigationController pushViewController:dvc animated:YES];
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
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


/* This should go in the collection view (nav controller of this table)
-(void)viewWillAppear:(BOOL)animated
{
	// force the tableview to load
    
	[theTableView reloadData];
}*/


@end
