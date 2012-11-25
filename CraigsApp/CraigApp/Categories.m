//
//  Categories.m
//  ISA
//
//  Created by Darshan Desai on 11/20/12.
//
//

#import "Categories.h"

@implementation Category

@synthesize name, codeName, subcats;

- (id) initCategoryWithName:(NSString*)newName andCode:(NSString*)newCode
{
    self = [super init];
    if (self) {
        name = newName;
        codeName = newCode;
        subcats = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)init
{
    return [self initCategoryWithName:@"Please Initialize" andCode:@"PLZ-INIT"];
}

- (void) addSubCat:(NSString*)newName andCode:(NSString*)newCode andType:(SearchSubCatType)newType
{
    SubCategory *sc = [[SubCategory alloc] initSubcatWithName:newName andCode:newCode andParent:self.name andType:newType];
    [subcats addObject:sc];
}

@end

@implementation SubCategory

@synthesize parent, name, codeName, searchType;


- (id) initSubcatWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent andType:(SearchSubCatType)newType
{
    if(self = [super init]) {
        name = newName;
        codeName = newCode;
        parent = newParent;
        searchType = newType;
    }
    return self;
}

- (id)init
{
    return [self initSubcatWithName:@"PLEASE INITIALIZE" andCode:@"PLZ_INIT" andParent:@"Please Initialize" andType:SEARCH_INVALID];
}


@end
