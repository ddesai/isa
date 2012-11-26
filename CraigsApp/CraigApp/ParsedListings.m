//
//  ParsedListings.m
//  ISA
//
//  Created by Hayley Wu on 11/25/12.
//
//

#import "ParsedListings.h"

static NSString *postDateAttr = @"class"; // key and not the value
static NSString *postDateTag = @"span";

@implementation ParsedListings

@synthesize listings, urlsToParse;

-(BOOL)parseDocumentWithURL:(NSURL *)theListing{
    if (theListing == nil)
        return NO;
    
    NSLog(@"Listing URL: %@", theListing.absoluteString);
    
    // this is the parsing machine
    NSXMLParser *xmlparser = [[NSXMLParser alloc]  initWithContentsOfURL:theListing];
    
    // this class will handle the events
    [xmlparser setDelegate:self];
    [xmlparser setShouldResolveExternalEntities:NO];
    
    // now parse the document
    BOOL ok = [xmlparser parse];
    if (ok == NO)
        NSLog(@"error in trying to parse listings");
    else
        NSLog(@"succesfully parsed listings");
    
    return ok;
}


- (id)initWithArray:(NSArray *)urlListings{
    self = [super init];
    if (self != nil)
    {
        //self.urlsToParse = urlListings;
        self.urlsToParse = [[NSMutableArray alloc] initWithArray:urlListings];
        self.listings = [[NSMutableArray alloc]init];
        workingEntry = [[NSMutableDictionary alloc]init];
        if(self.urlsToParse.count>0){
            NSString *theListing = [self.urlsToParse objectAtIndex:0];
            NSURL *theListingURL = [[NSURL alloc]initWithString:theListing];
            NSLog(@"Listing URL - 0: %@", theListingURL.absoluteString);
            [self parseDocumentWithURL:theListingURL];
        }

    }
    return self;
}



- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict
{
    
    NSLog(@"element begin tag found: %@", elementName);
    // entry: { id (link), im:name (app name), im:image (variable height) }
    /*
    if ([elementName isEqualToString:@"span"] && [[attributeDict objectForKey:@"class"] isEqualToString: @"postingdate"])
	{
        [workingEntry setObject:nil forKey:@"postDate"];  // set object later
        storingCharacterData = YES;
    }
    else storingCharacterData = NO;*/
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"didEndElement: %@", elementName);
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    NSLog(@"element has value %@\n", string);
}


// error handling
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"XMLParser error: %@", [parseError localizedDescription]);
}

-(void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    NSLog(@"XMLParser error: %@", [validationError localizedDescription]);
}




@end
