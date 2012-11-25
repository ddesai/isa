//
//  DataModel.m
//  CraigApp
//
//  Created by Darshan Desai on 10/29/12.
//
//

#import "DataModel.h"

@implementation DataModel

@synthesize categories, locations, regions, neighborhoods, towns, sections, test, listingResults;
@synthesize currentCategory, currentLocation, currentSection;

- (id)init
{
    self = [super init];
    if (self) {
        sections = [[NSMutableArray alloc] init];
        categories = [[NSMutableArray alloc] init];
        [self populateCategories];
        
        locations = [[NSMutableArray alloc] init];
        [self populateLocations];
        
        regions = [[NSMutableArray alloc] init];
        neighborhoods = [[NSMutableArray alloc] init];
        towns = [[NSMutableArray alloc] init];
        test = @"HelloT";
        
        currentSection = SECTION_INIT;
        currentCategory = categories[1];
        currentLocation = locations[0];
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

// ******** Categories
- (SubCategory *)getCategoryAtIndex: (NSUInteger) index
{
    return [categories objectAtIndex:index];
}

- (NSString *)getCategoryNameAtIndex: (NSUInteger) index
{
    return [[categories objectAtIndex:index] name];
}

- (NSString *)getCategoryCodeAtIndex: (NSUInteger) index
{
    return [[categories objectAtIndex:index] codeName];
}

- (NSUInteger)numberOfCategories
{
    return [categories count];
}


// ******** Regions
- (Location *)getLocationAtIndex: (NSUInteger) index
{
    return [locations objectAtIndex:index];
}

- (NSString *)getLocationNameAtIndex: (NSUInteger) index
{
    return [[locations objectAtIndex:index] name];
}

- (NSString *)getLocationCodeAtIndex: (NSUInteger) index
{
    return [[locations objectAtIndex:index] codeName];
}

- (NSUInteger)numberOfLocations
{
    return [locations count];
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

// ******** Craigslist Locations
- (void)populateLocations
{
    Metro *m;
    Country *c;
    
    c = [[Country alloc] initCountryWithName:@"USA" andCode:@"usa"];
    
    m = [[Metro alloc] initMetroWithName:@"SF Bay Area" andCode:@"sfbay" andParent:@"usa"];
    [m addRegion:@"All SF Bay Area" andCode:@"" andParent:@"sfbay"];
    [m addRegion:@"San Francisco" andCode:@"sfc" andParent:@"sfbay"];
    [m addRegion:@"South Bay" andCode:@"sby" andParent:@"sfbay"];
    [m addRegion:@"East Bay" andCode:@"eby" andParent:@"sfbay"];
    [m addRegion:@"Peninsula" andCode:@"pen" andParent:@"sfbay"];
    [m addRegion:@"North Bay" andCode:@"nby" andParent:@"sfbay"];
    [m addRegion:@"Santa Cruz" andCode:@"scz" andParent:@"sfbay"];
    [c addMetro:m];

    [c addMetro:@"bakersfield" andCode:@"bakersfield" andParent:@"usa"];
    [c addMetro:@"chico" andCode:@"chico" andParent:@"usa"];
    [c addMetro:@"fresno" andCode:@"fresno" andParent:@"usa"];
    [c addMetro:@"gold country" andCode:@"goldcountry" andParent:@"usa"];
    [c addMetro:@"hanford" andCode:@"hanford" andParent:@"usa"];
    [c addMetro:@"humboldt" andCode:@"humboldt" andParent:@"usa"];
    [c addMetro:@"inland empire" andCode:@"inlandempire" andParent:@"usa"];
    [c addMetro:@"klamath falls" andCode:@"klamath" andParent:@"usa"];
    [c addMetro:@"las vegas" andCode:@"lasvegas" andParent:@"usa"];
    [c addMetro:@"los angeles" andCode:@"losangeles" andParent:@"usa"];
    [c addMetro:@"medford" andCode:@"medford" andParent:@"usa"];
    [c addMetro:@"mendocino co" andCode:@"mendocino" andParent:@"usa"];
    [c addMetro:@"merced" andCode:@"merced" andParent:@"usa"];
    [c addMetro:@"modesto" andCode:@"modesto" andParent:@"usa"];
    [c addMetro:@"monterey" andCode:@"monterey" andParent:@"usa"];
    [c addMetro:@"orange co" andCode:@"orangecounty" andParent:@"usa"];
    [c addMetro:@"redding" andCode:@"redding" andParent:@"usa"];
    [c addMetro:@"roseburg" andCode:@"roseburg" andParent:@"usa"];
    [c addMetro:@"sacramento" andCode:@"sacramento" andParent:@"usa"];
    [c addMetro:@"san luis obispo" andCode:@"slo" andParent:@"usa"];
    [c addMetro:@"santa barbara" andCode:@"santabarbara" andParent:@"usa"];
    [c addMetro:@"santa maria" andCode:@"santamaria" andParent:@"usa"];
    [c addMetro:@"siskiyou co" andCode:@"siskiyou" andParent:@"usa"];
    [c addMetro:@"stockton" andCode:@"stockton" andParent:@"usa"];
    [c addMetro:@"susanville" andCode:@"susanville" andParent:@"usa"];
    [c addMetro:@"ventura" andCode:@"ventura" andParent:@"usa"];
    [c addMetro:@"visalia-tulare" andCode:@"visalia" andParent:@"usa"];
    [c addMetro:@"yuba-sutter" andCode:@"yubasutter" andParent:@"usa"];
    
    [locations addObjectsFromArray:[c metros]];
}

// ******** Craigslist Categories
- (void)populateCategories
{
    Category *c;
    
    // Initialize the Housing Category and subcats
    c = [[Category alloc] initCategoryWithName:@"housing" andCode:@"hhh"];
    [c addSubCat:@"Housing" andCode:@"hhh" andType:SEARCH_HOUSING];
    [c addSubCat:@"Apt/Housing" andCode:@"apa" andType:SEARCH_HOUSING];
    [c addSubCat:@"Rooms/Shared" andCode:@"roo" andType:SEARCH_HOUSING];
    [c addSubCat:@"Sublets/Temporary" andCode:@"sub" andType:SEARCH_HOUSING];
    [c addSubCat:@"Housing Wanted" andCode:@"hsw" andType:SEARCH_HOUSING];
    [c addSubCat:@"Housing Swap" andCode:@"swp" andType:SEARCH_HOUSING];
    [c addSubCat:@"Vacation Rentals" andCode:@"vac" andType:SEARCH_HOUSING];
    [c addSubCat:@"Parking/Storage" andCode:@"prk" andType:SEARCH_HOUSING];
    [c addSubCat:@"Office/Commercial" andCode:@"off" andType:SEARCH_HOUSING];
    [c addSubCat:@"Real Estate for sale" andCode:@"rea" andType:SEARCH_HOUSING];
    //[categories setObject:c forKey:@"hhh"];

    // Adds these subcategories in categories Array
    [categories addObjectsFromArray:[c subcats]];
    
    // Initialize the Housing Category and subcats
    c = [[Category alloc] initCategoryWithName:@"For Sale" andCode:@"sss"];
    [c addSubCat:@"For Sale" andCode:@"sss" andType:SEARCH_FORSALE];
    [c addSubCat:@"Appliances" andCode:@"ppa" andType:SEARCH_FORSALE];
    [c addSubCat:@"Antiques" andCode:@"ata" andType:SEARCH_FORSALE];
    [c addSubCat:@"Barter" andCode:@"bar" andType:SEARCH_FORSALE];
    [c addSubCat:@"Bikes" andCode:@"bia" andType:SEARCH_FORSALE];
    [c addSubCat:@"Boats" andCode:@"boo" andType:SEARCH_FORSALE];
    [c addSubCat:@"Books" andCode:@"bka" andType:SEARCH_FORSALE];
    [c addSubCat:@"Business" andCode:@"bfa" andType:SEARCH_FORSALE];
    [c addSubCat:@"Computer" andCode:@"sya" andType:SEARCH_FORSALE];
    [c addSubCat:@"Free" andCode:@"zip" andType:SEARCH_FORSALE];
    [c addSubCat:@"Furniture" andCode:@"fua" andType:SEARCH_FORSALE];
    [c addSubCat:@"General" andCode:@"foa" andType:SEARCH_FORSALE];
    [c addSubCat:@"Jewelry" andCode:@"jwa" andType:SEARCH_FORSALE];
    [c addSubCat:@"Materials" andCode:@"maa" andType:SEARCH_FORSALE];
    [c addSubCat:@"RVs" andCode:@"rva" andType:SEARCH_FORSALE];
    [c addSubCat:@"Sporting" andCode:@"sga" andType:SEARCH_FORSALE];
    [c addSubCat:@"Tickets" andCode:@"tia" andType:SEARCH_FORSALE];
    [c addSubCat:@"Tools" andCode:@"tla" andType:SEARCH_FORSALE];
    [c addSubCat:@"Wanted" andCode:@"wan" andType:SEARCH_FORSALE];
    [c addSubCat:@"Arts & Crafts" andCode:@"ara" andType:SEARCH_FORSALE];
    [c addSubCat:@"Auto Parts" andCode:@"pta" andType:SEARCH_FORSALE];
    [c addSubCat:@"Baby & Kids" andCode:@"baa" andType:SEARCH_FORSALE];
    [c addSubCat:@"Beauty & Health" andCode:@"haa" andType:SEARCH_FORSALE];
    [c addSubCat:@"All Cars" andCode:@"cta" andType:SEARCH_FORSALE];
    [c addSubCat:@"Cars by Owners" andCode:@"cto" andType:SEARCH_FORSALE];
    [c addSubCat:@"Cars by Dealers" andCode:@"ctd" andType:SEARCH_FORSALE];
    [c addSubCat:@"CDs/DVDs/VHS" andCode:@"ema" andType:SEARCH_FORSALE];
    [c addSubCat:@"Cell Phones" andCode:@"moa" andType:SEARCH_FORSALE];
    [c addSubCat:@"Clothes etc" andCode:@"cla" andType:SEARCH_FORSALE];
    [c addSubCat:@"Collectibles" andCode:@"cba" andType:SEARCH_FORSALE];
    [c addSubCat:@"Electronics" andCode:@"ela" andType:SEARCH_FORSALE];
    [c addSubCat:@"Farm/Garden" andCode:@"gra" andType:SEARCH_FORSALE];
    [c addSubCat:@"Garage Sale" andCode:@"gms" andType:SEARCH_FORSALE];
    [c addSubCat:@"Household" andCode:@"hsa" andType:SEARCH_FORSALE];
    [c addSubCat:@"Motorcycles" andCode:@"mca" andType:SEARCH_FORSALE];
    [c addSubCat:@"Music Instruments" andCode:@"msa" andType:SEARCH_FORSALE];
    [c addSubCat:@"Photo/Video" andCode:@"pha" andType:SEARCH_FORSALE];
    [c addSubCat:@"Toys & Games" andCode:@"taa" andType:SEARCH_FORSALE];
    [c addSubCat:@"Video Gaming" andCode:@"vga" andType:SEARCH_FORSALE];
    
    // Adds more subcategories in categories Array
    [categories addObjectsFromArray:[c subcats]];
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