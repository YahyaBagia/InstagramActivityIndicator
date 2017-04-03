//
//  ViewController.h
//  InstagramActivityIndicator
//
//  Created by Yahya on 03/04/17.
//  Copyright © 2017 yahya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstagramActivityIndicator.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet InstagramActivityIndicator *activityIndicator;


@property (strong, nonatomic) IBOutletCollection(InstagramActivityIndicator) NSArray *smallActivityIndicators;

- (IBAction)btnStartStopClicked:(UIButton *)sender;

@end
