//
//  Locations.m
//  ISA
//
//  Created by Darshan Desai on 11/21/12.
//
//

#import "Locations.h"

// ============================================================
// Location Class
@implementation Location : NSObject

@synthesize name, codeName, parent;

// designated init
- (id) initLocationWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString *)newParent
{
    self = [super init];
    if (self) {
        name = newName;
        codeName = newCode;
        parent = newParent;
    }
    return self;
}

- (id)initLocationWithName:(NSString *)newName andCode:(NSString *)newCode
{
    return [self initLocationWithName:@"Please Initialize" andCode:@"PLZ-INIT" andParent:nil];
}

- (id)init
{
    return [self initLocationWithName:@"Please Initialize" andCode:@"PLZ-INIT" andParent:nil];
}

@end

// ============================================================
// Town Class
@implementation Town : Location

// designated init
- (id) initTownWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString *)newParent
{
    self = [super initLocationWithName:newName andCode:newCode andParent:newParent];
    return self;
}

- (id)initTownWithName:(NSString *)newName andCode:(NSString *)newCode
{
    return [self initTownWithName:@"Please Initialize" andCode:@"PLZ-INIT" andParent:nil];
}

- (id)init
{
    return [self initTownWithName:@"Please Initialize" andCode:@"PLZ-INIT" andParent:nil];
}

@end


// ============================================================
// Region Class
@implementation Region : Location

@synthesize towns;

// designated init
- (id) initRegionWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString *)newParent
{
    self = [super initLocationWithName:newName andCode:newCode andParent:newParent];
    if(self)
    {
        towns = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)initRegionWithName:(NSString *)newName andCode:(NSString *)newCode
{
    return [self initRegionWithName:@"Please Initialize" andCode:@"PLZ-INIT" andParent:nil];
}

- (id)init
{
    return [self initRegionWithName:@"Please Initialize" andCode:@"PLZ-INIT" andParent:nil];
}

- (void) addTown:(Town *)t
{
    [towns setObject:t forKey:t.codeName];
}

- (void) addTown:(NSString*)newName andCode:(NSString*)newCode
{
    [self addTown:newName andCode:newCode andParent:nil];
}

- (void) addTown:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString*) newParent
{
    Town *t = [[Town alloc] initTownWithName:newName andCode:newCode andParent:newParent];
    [towns setObject:t forKey:newCode];
}

@end



// ============================================================
// Metro Class
@implementation Metro : Location

@synthesize regions;

// designated init
- (id) initMetroWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString *)newParent
{
    self = [super initLocationWithName:newName andCode:newCode andParent:newParent];
    if(self)
    {
        regions = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)initMetroWithName:(NSString *)newName andCode:(NSString *)newCode
{
    return [self initMetroWithName:@"Please Initialize" andCode:@"PLZ-INIT" andParent:nil];
}

- (id)init
{
    return [self initMetroWithName:@"Please Initialize" andCode:@"PLZ-INIT" andParent:nil];
}

- (void) addRegion:(Region *)r
{
    [regions setObject:r forKey:r.codeName];
}

- (void) addRegion:(NSString *)newName andCode:(NSString *)newCode
{
    [self addRegion:newName andCode:newCode andParent:nil];
}

- (void) addRegion:(NSString *)newName andCode:(NSString *)newCode andParent:(NSString*) newParent
{
    Region *r = [[Region alloc] initRegionWithName:newName andCode:newCode andParent:newParent];
    [regions setObject:r forKey:newCode];
}

@end


// ============================================================
// Metro Class
@implementation Country : Location

@synthesize metros;

// designated init
- (id) initCountryWithName:(NSString*)newName andCode:(NSString*)newCode andParent:(NSString *)newParent
{
    self = [super initLocationWithName:newName andCode:newCode andParent:newParent];
    if(self)
    {
        metros = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)initCountryWithName:(NSString *)newName andCode:(NSString *)newCode
{
    return [self initCountryWithName:@"Please Initialize" andCode:@"PLZ-INIT" andParent:nil];
}

- (id)init
{
    return [self initCountryWithName:@"Please Initialize" andCode:@"PLZ-INIT" andParent:nil];
}

- (void) addMetro:(Metro *)m
{
    [metros setObject:m forKey:m.codeName];
    
}

- (void) addMetro:(NSString *)newName andCode:(NSString *)newCode
{
    [self addMetro:newName andCode:newCode];
}

- (void) addMetro:(NSString *)newName andCode:(NSString *)newCode andParent:(NSString*) newParent
{
    Metro *m = [[Metro alloc] initMetroWithName:newName andCode:newCode andParent:newParent];
    [metros setObject:m forKey:newCode];
}

@end
