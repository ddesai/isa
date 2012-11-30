//
//  ListingViewController.h
//  CraigApp
//
//  Created by Darshan Desai on 10/30/12.
//
//

#import <UIKit/UIKit.h>
#import "ResultData.h"
#import "TableCell.h"
#import "ParsedListings.h"
#import "DetailViewController.h"

@interface ListingViewController : UITableViewController <NSXMLParserDelegate>

-(BOOL)parseDocumentWithNSData:(NSData *)data;
-(void) addDataToFavorites:(int)row;
-(void)removeDataFromFavorites;

@end
