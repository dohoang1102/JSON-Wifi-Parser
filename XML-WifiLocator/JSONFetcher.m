//
//  JSONFetcher.m
//  WifiLocator
//
//  Created by TIMOTHY KROPP on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "JSONFetcher.h"

// Category -- for hiding functions when we import the .h of jsonfetcher, these will not be available for use

@interface JSONFetcher (InternalFunctions)
-(void) startWebserviceRequest; // private - need category 
-(NSDictionary*) convertData: (NSData*)data; // private - need category
@end

@implementation JSONFetcher
@synthesize jsonURL, delegate;

-(id) initWithURL:(NSURL *)url
{
    if (self = [super init ])
    {
        self.jsonURL = url;
        _data = [NSMutableData new];
    } 
    return self;
}

-(void) fire
{
    [self startWebserviceRequest];
    //NSLog(@"Did Fire");
}

// in order for this to work we need an NSURL connection delegate (so that the connection can respond back to object with update on the connection)
-(void) startWebserviceRequest
{
    NSURLRequest* request = [NSURLRequest requestWithURL:self.jsonURL];
    
    NSURLConnection* connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [connection start];
}

-(NSDictionary*) convertData: (NSData*)data
{
    //return nil;

    NSJSONSerialization* converter = [NSJSONSerialization JSONObjectWithData:_data options:nil error:nil];
    

    NSLog(@"Converter: %@", converter);
}


// Delegate functions

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{

NSLog(@"connectionDidFinishLoading with Length: %i", _data.length/8);
    id collection  = [self convertData:_data];
    
    if ([collection isKindOfClass:[NSArray class]])
    {
        [delegate fetcher:self didFinishWithArray:collection];
    } 
    else
    {
        [delegate fetcher:self didFinishWithDictionary:collection];
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
NSLog(@"didFailWithError");
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"didReceiveResponse");
    _data.length = 0;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"didReceiveData with length: %iB",_data.length/8);
    [_data appendData:data];
}
@end



