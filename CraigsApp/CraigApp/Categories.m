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
        subcats = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)init
{
    return [self initCategoryWithName:@"Please Initialize" andCode:@"PLZ-INIT"];
}

- (void) addSubCat:(NSString*)newName andCode:(NSString*)newCode
{
    SubCategory *sc = [[SubCategory alloc] initSubcatWithName:newName andCode:newCode andParent:name];
    [subcats setObject:sc forKey:newCode];
}

@end

@implementation SubCategory

@synthesize parent, name, codeName;


- (id) initSubcatWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*)newParent
{
    if(self = [super init]) {
        name = newName;
        codeName = newCode;
        parent = newParent;
    }
    return self;
}

- (id)init
{
    return [self initSubcatWithName:@"PLEASE INITIALIZE" andCode:@"PLZ_INIT" andParent:@"Please Initialize"];
}


@end
