//
//  MasterViewController.h
//  WiFiHotspots
//
//  Created by TIMOTHY KROPP on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WifiParser.h"
@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) WifiParser* parser;

@end
