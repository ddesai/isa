//
//  SearchSelectionDelegate.h
//  ISA
//
//  Created by Darshan Desai on 11/15/12.
//
//

#import <Foundation/Foundation.h>

// This is used to delegate the data updates from the detailViewController
// Back to the main screen
@protocol SearchSelectionDelegate <NSObject>

- (void) searchCategoryChanged: (NSString*) data;

@end
