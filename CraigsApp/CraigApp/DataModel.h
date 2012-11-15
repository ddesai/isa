//
//  DataModel.h
//  CraigApp
//
//  Created by Darshan Desai on 10/29/12.
//
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
{
    int currentSection;
}

@property (atomic) int currentSection;
@property (strong, atomic) NSMutableArray *sections;
@property (strong, atomic) NSMutableArray *regions;
@property (strong, atomic) NSMutableArray *categories;
@property (strong, atomic) NSMutableArray *neighborhoods;
@property (strong, atomic) NSMutableArray *towns;
@property (strong, atomic) NSString *test;
@property (strong, atomic) NSData* listingResults;

// ******** Craigslist Sections
- (void)addSection:(NSString *) newMember;
- (NSString *)getSectionAtIndex: (NSUInteger) index;
- (NSUInteger)numberOfSections;

// ******** Craigslist Regions
- (void)addRegion: (NSString *) newMember;
- (NSString *)getRegionAtIndex: (NSUInteger) index;
- (NSUInteger)numberOfRegions;

// ******** Craigslist Categories
- (void)addCategory: (NSString *) newMember;
- (NSString *)getCategoryAtIndex: (NSUInteger) index;
- (NSUInteger)numberOfCategories;

// ******** Neighborhoods
- (void)addNeighborhood:(NSString *) newMember;
- (NSString *)getNeighborhoodAtIndex: (NSUInteger) index;
- (NSUInteger)numberOfNeighborhoods;

// ********** Towns
- (void)addTown:(NSString *) newMember;
- (NSString *)getTownAtIndex: (NSUInteger) index;
- (NSUInteger)numberOfTowns;

@end
