//
//  ViewController.m
//  InstagramActivityIndicator
//
//  Created by Yahya on 03/04/17.
//  Copyright © 2017 yahya. All rights reserved.
//

#import "ViewController.h"
#import "InstagramActivityIndicator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //ADD INDICATOR THROUGH CODE
    InstagramActivityIndicator *indicator = [[InstagramActivityIndicator alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
    indicator.lineWidth = 3;
    indicator.strokeColor = [UIColor brownColor];
    indicator.numSegments = 15;
    indicator.rotationDuration = 10;
    indicator.animationDuration = 1.0;
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator startAnimating];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)btnStartStopClicked:(UIButton *)sender {
    if(sender.tag == 1){
        for(InstagramActivityIndicator *indicator in _smallActivityIndicators){
            if(indicator.isAnimating){
                [indicator stopAnimating];
            }else{
                [indicator startAnimating];
            }
        }
    }
    else{
        if(_activityIndicator.isAnimating){
            [_activityIndicator stopAnimating];
        }else{
            [_activityIndicator startAnimating];
        }
    }
}

@end
