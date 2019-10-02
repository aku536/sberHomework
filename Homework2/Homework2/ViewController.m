//
//  ViewController.m
//  Homework2
//
//  Created by Кирилл Афонин on 01/10/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

#import "ViewController.h"
#import "ISSWaiter.h"
#import "WaiterProtocol.h"

/**
 Клиент
 */
@interface ViewController ()

/**
 Официант должен соответствовать протоколу
 */
@property (nonatomic, strong) id <WaiterProtocol> waiter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.waiter = [ISSWaiter new];

    // Делаем заказ и оставляем чаевые, если официант их принимает
    [self makeOrder];
    if ([self.waiter respondsToSelector:@selector(takeTips:)])
    {
        [self leaveTips:10];
    }
    
}

- (void)makeOrder
{
    [self.waiter takeOrder];
}

- (void)leaveTips:(int)tips;
{
    [self.waiter takeTips:tips];
}


@end
