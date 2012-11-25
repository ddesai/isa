//
//  DataModel.h
//  CraigApp
//
//  Created by Darshan Desai on 10/29/12.
//
//

#import <Foundation/Foundation.h>
#import "Categories.h"
#import "Locations.h"

typedef enum
{
    SECTION_INIT=-1,
    SECTION_CATEGORY,
    SECTION_LOCATION,
    SECTION_INVALID
} SectionTypeEnum;


@interface DataModel : NSObject
{
    SectionTypeEnum currentSection;
    Location *currentLocation;
    SubCategory *currentCategory;
}

@property (atomic) SectionTypeEnum currentSection;
@property (atomic) Location *currentLocation;
@property (atomic) SubCategory *currentCategory;
@property (strong, atomic) NSMutableArray *categories;
@property (strong, atomic) NSMutableArray *locations;
@property (strong, atomic) NSMutableArray *sections;
@property (strong, atomic) NSMutableArray *regions;
@property (strong, atomic) NSMutableArray *neighborhoods;
@property (strong, atomic) NSMutableArray *towns;
@property (strong, atomic) NSString *test;
@property (strong, atomic) NSData* listingResults;

// ******** Craigslist Sections
- (void)addSection:(NSString *) newMember;
- (NSString *)getSectionAtIndex: (NSUInteger) index;
- (NSUInteger)numberOfSections;

// ******** Craigslist Categories
- (void)addCategory: (NSString *) newMember;
- (SubCategory *)getCategoryAtIndex: (NSUInteger) index;
- (NSString *)getCategoryNameAtIndex: (NSUInteger) index;
- (NSString *)getCategoryCodeAtIndex: (NSUInteger) index;
- (NSUInteger)numberOfCategories;

// ******** Craigslist Locations
- (Location *)getLocationAtIndex: (NSUInteger) index;
- (NSString *)getLocationNameAtIndex: (NSUInteger) index;
- (NSString *)getLocationCodeAtIndex: (NSUInteger) index;
- (NSUInteger)numberOfLocations;

// ******** Craigslist Regions
- (void)addRegion: (NSString *) newMember;
- (NSString *)getRegionAtIndex: (NSUInteger) index;
- (NSUInteger)numberOfRegions;

// ******** Neighborhoods
- (void)addNeighborhood:(NSString *) newMember;
- (NSString *)getNeighborhoodAtIndex: (NSUInteger) index;
- (NSUInteger)numberOfNeighborhoods;

// ********** Towns
- (void)addTown:(NSString *) newMember;
- (NSString *)getTownAtIndex: (NSUInteger) index;
- (NSUInteger)numberOfTowns;

@end
