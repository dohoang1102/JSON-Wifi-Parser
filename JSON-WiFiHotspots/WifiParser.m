//
//  WifiParser.m
//  WiFiHotspots
//
//  Created by TIMOTHY KROPP on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WifiParser.h"

@implementation WifiParser
@synthesize parser, url;


-(id) init
{
 // Initialize parent class
    self = [super init];
    
 // If valid, customize this object
    if (self)
    {
        url = [NSURL URLWithString:@"http://google.com"];
    }
    return self;
    
 // return this object
    
}
-(id) initWithXMLURL:(NSURL *)urlIn
{
    self = [self init];
     
    if (self) {
        if (url) {
            self.url = urlIn;
            
            parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
            parser.delegate = self;
            
            [parser parse];
            
        }
    } 
    
    return self;
    
}

-(id) initJSONURL:(NSURL *)urlIn
{
    self = [self init];
    
    if (self) {
        // fill with JSON implementation
    }
    
    return self;
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"Start tag: %@", elementName);

}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"    Found tag: %@", string);
}

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"End tag: %@", elementName);
}

@end
