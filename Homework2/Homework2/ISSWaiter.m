//
//  ISSWaiter.m
//  Homework2
//
//  Created by Кирилл Афонин on 01/10/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

#import "ISSWaiter.h"
#import "ISSKitchen.h"

@interface ISSWaiter ()
@property (nonatomic, strong) ISSKitchen *kitchen;
@property (nonatomic, assign) int *tips;
@end

@implementation ISSWaiter

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.kitchen = [ISSKitchen new];
        self.kitchen.delegate = self;
    }
    return self;
}


/**
 Принимает заказ у клиента и передает на кухню
 */
- (void)takeOrder {
    NSLog(@"Заказ начали готовить. Время готовности: 5 сек");
    [self.kitchen prepareOrder];
}


/**
 Если заказ готов, отдаем клиенту
 */
- (void)deliverOrder {
    if (self.kitchen.isPrepared)
    {
        NSLog(@"Заказ готов, приятного аппетита!");
    }
}


/**
 Получаем чаевые от клиента

 @param tips количество чаевых
 */
- (void)takeTips:(int)tips
{
    self.tips += tips;
    NSLog(@"Вы оставили чаевые в размере: %d. Спасибо, приходите ещё!", tips);
}

@end
