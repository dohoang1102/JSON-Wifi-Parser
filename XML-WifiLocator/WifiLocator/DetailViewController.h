//
//  DetailViewController.h
//  WifiLocator
//
//  Created by TIMOTHY KROPP on 12/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, MKMapViewDelegate>


- (IBAction)pressedLocate:(id)sender;


@property (weak, nonatomic) IBOutlet MKMapView *wifiMap;
@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
