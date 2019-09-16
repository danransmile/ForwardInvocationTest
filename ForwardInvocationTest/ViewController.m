//
//  ViewController.m
//  ForwardInvocationTest
//
//  Created by 刘艳芹 on 2019/5/24.
//  Copyright © 2019 刘艳芹. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Car *ccc = [Car new];
    [ccc runTo:@"111"];
}


@end
