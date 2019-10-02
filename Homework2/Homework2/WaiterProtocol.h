//
//  WaiterProtocol.h
//  Homework2
//
//  Created by Кирилл Афонин on 01/10/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//


/**
 Официант должен уметь принимать заказ и относить его клиенту. Возможно, он может брать чаевые.
 */
@protocol WaiterProtocol <NSObject>

// Официант принимает заказ и передает его на кухню
- (void)takeOrder;

// Официант приносит готовый заказ клиенту
- (void)deliverOrder;

@optional
// Официант может взять чаевые
- (void)takeTips:(int)tips;

@end
