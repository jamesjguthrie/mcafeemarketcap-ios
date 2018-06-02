//
//  MMHomeViewController.m
//  MarketCap
//
//  Created by Daniel S on 6/1/18.
//  Copyright © 2018 Daniel S. All rights reserved.
//

#import "MMHomeViewController.h"

@interface MMHomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *topButton;
@property (weak, nonatomic) IBOutlet UIButton *watchButton;

@end

@implementation MMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _topButton.layer.borderColor = [UIColor grayColor].CGColor;
    _watchButton.layer.borderColor = [UIColor grayColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
