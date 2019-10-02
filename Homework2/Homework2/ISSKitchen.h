//
//  ISSKitchen.h
//  Homework2
//
//  Created by Кирилл Афонин on 01/10/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WaiterProtocol.h"


/**
 Класс кухня
 */
@interface ISSKitchen : NSObject


/**
 Официант является делегатом кухни, поэтому он должен соответствовать требованиям
 */
@property (nonatomic, weak) id <WaiterProtocol> delegate;

/**
 Готовность заказа
 */
@property (nonatomic, assign)BOOL isPrepared;


/**
 Начинает приготовление заказа
 */
- (void)prepareOrder;
@end

