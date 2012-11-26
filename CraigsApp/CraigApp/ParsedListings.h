//
//  ParsedListings.h
//  ISA
//
//  Created by Hayley Wu on 11/25/12.
//
//

#import <Foundation/Foundation.h>

@interface ParsedListings : NSObject <NSXMLParserDelegate>
{
    BOOL storingCharacterData;
    NSMutableDictionary *workingEntry;
    NSMutableString *entryString;
}

@property NSMutableArray *listings;
@property NSArray *urlsToParse;

-(BOOL)parseDocumentWithURL:(NSURL *)theListing;
- (id)initWithArray:(NSArray *)urlListings;

@end
