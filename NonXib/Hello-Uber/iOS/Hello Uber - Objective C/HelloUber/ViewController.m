//
//  ViewController.m
//  HelloUber
//
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ViewController.h"

#import "Hello.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Hello* hello = [[Hello alloc] init];
    [hello helloFrom:@"Uber"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
