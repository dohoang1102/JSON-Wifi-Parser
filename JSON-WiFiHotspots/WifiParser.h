//
//  WifiParser.h
//  WiFiHotspots
//
//  Created by TIMOTHY KROPP on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WifiParser : NSObject <NSXMLParserDelegate>

@property (strong,nonatomic) NSXMLParser* parser;
@property (strong,nonatomic) NSURL* url;



-(id) initWithXMLURL: (NSURL*) urlIn;
-(id) initJSONURL: (NSURL*) urlIn;

@end
