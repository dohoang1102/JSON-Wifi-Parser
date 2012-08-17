//
//  JSONFetcher.h
//  WifiLocator
//
//  Created by TIMOTHY KROPP on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
// Forward declaration of the protocol we created to ensure that the property can recognize it
@protocol JSONFetcherDelegate;

// we needed to add NSURLConnectionDelegate (see .m)
@interface JSONFetcher : NSObject <NSURLConnectionDataDelegate>
{
    //ivar
    NSMutableData* _data;
}

@property (strong,nonatomic) NSURL* jsonURL;
@property (weak,nonatomic) id<JSONFetcherDelegate> delegate;

-(id) initWithURL: (NSURL*) url; //Sets URL but doesnt start download
-(void) fire; // Triggers downloa and data conversion


@end
// our custom protocol delegate to get data from the json fetcher to the View Controllers

@protocol JSONFetcherDelegate <NSObject>
@optional
-(void) fetcher:(JSONFetcher*)fetcher didFinishWithDictionary: (NSMutableDictionary*)dictionary;

-(void) fetcher:(JSONFetcher*)fetcher didFinishWithArray:(NSMutableArray*)array;


@end

