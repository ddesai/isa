//
//  DataModel.m
//  CraigApp
//
//  Created by Darshan Desai on 10/29/12.
//
//

#import "DataModel.h"

@implementation DataModel

@synthesize regions, categories, neighborhoods, towns, sections, currentSection;

- (id)init
{
    self = [super init];
    if (self) {
        sections = [[NSMutableArray alloc] init];
        regions = [[NSMutableArray alloc] init];
        categories = [[NSMutableArray alloc] init];
        neighborhoods = [[NSMutableArray alloc] init];
        towns = [[NSMutableArray alloc] init];
    }
    return self;
}


// ******** Regions
- (void)addSection: (NSString *) newMember
{
    [sections addObject:newMember];
}

- (NSString *)getSectionAtIndex: (NSUInteger) index
{
    return [sections objectAtIndex:index];
}

- (NSUInteger)numberOfSections
{
    return [sections count];
}


// ******** Regions
- (void)addRegion: (NSString *) newMember
{
    [regions addObject:newMember];
}

- (NSString *)getRegionAtIndex: (NSUInteger) index
{
    return [regions objectAtIndex:index];
}

- (NSUInteger)numberOfRegions
{
    return [regions count];
}

// ******** Craigslist Categories
- (void)addCategory: (NSString *) newMember
{
    [categories addObject:newMember];
}

- (NSString *)getCategoryAtIndex: (NSUInteger) index
{
    return [categories objectAtIndex:index];
}

- (NSUInteger)numberOfCategories
{
    return [categories count];
}

// ******** Neighborhoods
- (void)addNeighborhood:(NSString *) newMember
{
    [neighborhoods addObject:newMember];
}

- (NSString *)getNeighborhoodAtIndex: (NSUInteger) index
{
    return [neighborhoods objectAtIndex:index];
}

- (NSUInteger)numberOfNeighborhoods
{
    return [neighborhoods count];
}

// ********** Towns
- (void)addTown:(NSString *) newMember
{
    [towns addObject:newMember];
}

- (NSString *)getTownAtIndex: (NSUInteger) index
{
    return [towns objectAtIndex:index];
}

- (NSUInteger)numberOfTowns
{
    return [towns count];
}

@end