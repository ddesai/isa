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
        
        [self addSection:@"Category"];
        [self addSection:@"Location"];

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


// ******** Locations
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
    
    // Initialize the For Sale Category
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
    
    // Initialize the GIGS Category
    c = [[Category alloc] initCategoryWithName:@"Gigs" andCode:@"ggg"];
    [c addSubCat:@"Gigs" andCode:@"ggg" andType:SEARCH_GIGS];
    [c addSubCat:@"Crew" andCode:@"cwg" andType:SEARCH_GIGS];
    [c addSubCat:@"Event" andCode:@"evg" andType:SEARCH_GIGS];
    [c addSubCat:@"Labor" andCode:@"lbg" andType:SEARCH_GIGS];
    [c addSubCat:@"Talent" andCode:@"tlg" andType:SEARCH_GIGS];
    [c addSubCat:@"Computer" andCode:@"cpg" andType:SEARCH_GIGS];
    [c addSubCat:@"Creative" andCode:@"crg" andType:SEARCH_GIGS];
    [c addSubCat:@"Domestic" andCode:@"dmg" andType:SEARCH_GIGS];
    [c addSubCat:@"Writing" andCode:@"wrg" andType:SEARCH_GIGS];
    
    // Adds more subcategories in categories Array
    [categories addObjectsFromArray:[c subcats]];

    // Initialize the Resumes Category
    c = [[Category alloc] initCategoryWithName:@"Resumes" andCode:@"res"];
    [c addSubCat:@"Resumes" andCode:@"res" andType:SEARCH_RESUME];

    // Adds more subcategories in categories Array
    [categories addObjectsFromArray:[c subcats]];

    // Initialize the Services Category
    c = [[Category alloc] initCategoryWithName:@"Services" andCode:@"bbb"];
    [c addSubCat:@"Services" andCode:@"bbb" andType:SEARCH_SERVICES];
    [c addSubCat:@"Beauty" andCode:@"bts" andType:SEARCH_SERVICES];
    [c addSubCat:@"Creative" andCode:@"crs" andType:SEARCH_SERVICES];
    [c addSubCat:@"Computer" andCode:@"cps" andType:SEARCH_SERVICES];
    [c addSubCat:@"Cycle" andCode:@"cys" andType:SEARCH_SERVICES];
    [c addSubCat:@"Event" andCode:@"evs" andType:SEARCH_SERVICES];
    [c addSubCat:@"Financial" andCode:@"fns" andType:SEARCH_SERVICES];
    [c addSubCat:@"Legal" andCode:@"lgs" andType:SEARCH_SERVICES];
    [c addSubCat:@"Lessons" andCode:@"lss" andType:SEARCH_SERVICES];
    [c addSubCat:@"Marine" andCode:@"mas" andType:SEARCH_SERVICES];
    [c addSubCat:@"Pets" andCode:@"pas" andType:SEARCH_SERVICES];
    [c addSubCat:@"Automotive" andCode:@"aos" andType:SEARCH_SERVICES];
    [c addSubCat:@"Farm + Garden" andCode:@"fgs" andType:SEARCH_SERVICES];
    [c addSubCat:@"Household" andCode:@"hss" andType:SEARCH_SERVICES];
    [c addSubCat:@"Labor/Move" andCode:@"lbs" andType:SEARCH_SERVICES];
    [c addSubCat:@"Skill'd Trade" andCode:@"sks" andType:SEARCH_SERVICES];
    [c addSubCat:@"Real Estate" andCode:@"rts" andType:SEARCH_SERVICES];
    [c addSubCat:@"Small Biz Ads" andCode:@"biz" andType:SEARCH_SERVICES];
    [c addSubCat:@"Therapeutic" andCode:@"thp" andType:SEARCH_SERVICES];
    [c addSubCat:@"Travel/Vacations" andCode:@"trv" andType:SEARCH_SERVICES];
    [c addSubCat:@"Write/Ed/Tr8" andCode:@"wet" andType:SEARCH_SERVICES];

    // Adds more subcategories in categories Array
    [categories addObjectsFromArray:[c subcats]];
    
    // Initialize the Community Category
    c = [[Category alloc] initCategoryWithName:@"Community" andCode:@"ccc"];
    [c addSubCat:@"Community" andCode:@"ccc" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Activities" andCode:@"act" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Artists" andCode:@"ats" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Childcare" andCode:@"kid" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"General" andCode:@"com" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Groups" andCode:@"grp" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Pets" andCode:@"pet" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Events" andCode:@"eve" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Lost + Found" andCode:@"laf" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Musicians" andCode:@"muc" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Local & News" andCode:@"vnn" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Politics" andCode:@"pol" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Rideshare" andCode:@"rid" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Volunteers" andCode:@"vol" andType:SEARCH_COMMUNITY];
    [c addSubCat:@"Classes" andCode:@"cls" andType:SEARCH_COMMUNITY];

    // Adds more subcategories in categories Array
    [categories addObjectsFromArray:[c subcats]];

}

@end