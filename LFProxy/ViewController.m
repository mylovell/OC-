//
//  ViewController.m
//  LFProxy
//
//  Created by Feng Luo on 2020/3/28.
//  Copyright © 2020 Feng Luo. All rights reserved.
//

#import "ViewController.h"
#import "Children.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    Children *c = [Children shareProxy];
    [c playGame:@"i play"];// Man的方法，Children未实现
    [c buyGame:@"i buy"];// Woman的方法，Children未实现
    
}


@end
