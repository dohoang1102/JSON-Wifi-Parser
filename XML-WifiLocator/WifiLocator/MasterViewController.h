//
//  MasterViewController.h
//  WifiLocator
//
//  Created by TIMOTHY KROPP on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONFetcher.h"
@class DetailViewController;
// add jsonfetcherdelegate (our protocol in fetcher)
@interface MasterViewController : UITableViewController <JSONFetcherDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) JSONFetcher* fetcher;
@end
