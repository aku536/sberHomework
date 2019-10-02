//
//  Kitchen.m
//  Homework2
//
//  Created by Кирилл Афонин on 01/10/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

#import "ISSKitchen.h"

@implementation ISSKitchen

- (void)prepareOrder
{
    NSDate *date = [NSDate date];
    while (date.timeIntervalSinceNow > -5) {
       // готовим заказ 5 секунд
    }
    
    self.isPrepared = YES;
    
    // Когда заказ готов, просим официанта доставить его
    [self.delegate deliverOrder];
}

@end
