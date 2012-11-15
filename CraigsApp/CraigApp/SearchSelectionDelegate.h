//
//  SearchSelectionDelegate.h
//  ISA
//
//  Created by Darshan Desai on 11/15/12.
//
//

#import <Foundation/Foundation.h>

@protocol SearchSelectionDelegate <NSObject>

- (void) searchCategoryChanged: (NSString*) data;

@end
