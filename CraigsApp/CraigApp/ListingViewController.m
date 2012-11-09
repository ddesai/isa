//
//  ListingViewController.m
//  CraigApp
//
//  Created by Darshan Desai on 10/30/12.
//
//

#import "ListingViewController.h"

@interface ListingViewController ()

@end

@implementation ListingViewController

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
    ResultData *sharedData = [ResultData getData];
    NSArray *listings= [sharedData getArrayData];
    return listings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    ResultData *sharedData = [ResultData getData];
    NSArray *listings= [sharedData getArrayData];
    
    NSDictionary *dic = [listings objectAtIndex:indexPath.row];
    
    
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%@", [dic objectForKey:@"title"]];
    cell.locationLabel.text = [NSString stringWithFormat:@"%@", [dic objectForKey:@"location"]];
    cell.priceLabel.text = [NSString stringWithFormat:@"$%@", [dic objectForKey:@"price"]];
    cell.bedLabel.text = [NSString stringWithFormat:@"beds: %@", [dic objectForKey:@"bed"]];
    cell.bathLabel.text = [NSString stringWithFormat:@"baths: %@", [dic objectForKey:@"bath"]];
    cell.dateLabel.text = [NSString stringWithFormat:@"%@", [dic objectForKey:@"date"]];
    //NSDate *object = _objects[indexPath.row];
    //cell.textLabel.text = [object description];
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
