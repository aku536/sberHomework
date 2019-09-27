//
//  ViewController.m
//  Homework1
//
//  Created by Кирилл Афонин on 26/09/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Задание 1. Работа с числовыми массивами
    [self performOperationsWithArray];
    
    // Задание 2. работа со строковыми массивами
    [self performOperationsWithStringArray];
}

#pragma mark - Operations with Number Array

- (void)performOperationsWithArray
{
    // Дано: массив чисел 3, 6, 32, 24, 81
    // Использую NSMutableArray для удобства, по условиям это не запрещено
    NSMutableArray *originalArray = [NSMutableArray array];
    [originalArray addObjectsFromArray: @[@(3), @(6), @(32), @(24), @(81)]];
    NSLog(@"Исходный массив: %@", originalArray.description);
    
    // 1. Отсортируйте этот массив по возрастанию.
    // Производительность не важна в данном задании, использую более удобный вариант сортировки - встроенный
    [originalArray sortUsingSelector:@selector(compare:)];
    NSLog(@"1. Отсортированный массив: %@", originalArray.description);
    
    // 2. Сделайте с помощью цикла массив, содержащий числа, большие чем 20.
    NSMutableArray *moreThanTwentyArray = [self createArrayWithNumbersMoreThanNumber:@(20) InArray:originalArray];
    NSLog(@"2. Массив с числами больше 20: %@", moreThanTwentyArray.description);
    
    // 3. Сделайте с помощью цикла массив, содержащий только кратные трём числа.
    NSMutableArray *multiplesOfThreeArray = [self multipleOfThreeArray:originalArray];
    NSLog(@"3. Массив чисел кратных 3: %@",  multiplesOfThreeArray.description);
    
    // 4. Добавьте этот массив в исходный.
    [originalArray addObjectsFromArray:multiplesOfThreeArray];
    NSLog(@"4. Объединенный массив: %@", originalArray.description);
    
    // 5. Отсортируйте его по убыванию.
    // Ещё один встроенный метод сортировки с набором опций
    [originalArray sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(compare:)]]];
    NSLog(@"5. Отсортированный объединенный массив: %@", originalArray.description);
}

// Принимает массив, проверяет является ли объект NSNumber и добавляет в новый массив числа больше заданного (20)
- (NSMutableArray *)createArrayWithNumbersMoreThanNumber:(NSNumber *)number InArray:(NSMutableArray *)array
{
    NSMutableArray *newArray = [NSMutableArray array];
    for (NSObject *object in array)
    {
        if ([object isKindOfClass: [NSNumber class]] && ((NSNumber *) object).intValue > number.intValue)
            {
                [newArray addObject:object];
            }
    }
    return newArray;
}

// Принимает массив, проверяет является ли объект NSNumber и добавляет в новый массив числа кратные 3
- (NSMutableArray *)multipleOfThreeArray:(NSMutableArray *)array
{
    NSMutableArray *newArray = [NSMutableArray array];
    for (NSObject *object in array)
    {
        if ([object isKindOfClass:[NSNumber class]])
        {
            if (((NSNumber *)object).intValue % 3 == 0)
            {
                [newArray addObject:object];
            }
        }
    }
    return newArray;
}

#pragma mark - Operations with String Array

- (void)performOperationsWithStringArray
{
    // Дано: Есть массив строк: "cataclism", "catepillar", "cat", "teapot", "truncate".
    NSArray *originalArray = @[@"cataclism", @"catepillar", @"cat", @"teapot", @"truncate"];
    NSLog(@"Исходный массив: %@", originalArray.description);
    
    // 1. Отфильтруйте так, чтобы остались только строки с префиксом "cat" (Поможет метод строки hasPrefix) с помощью NSPredicate.
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] 'cat'"];
    NSArray *filteredArray = [originalArray filteredArrayUsingPredicate:predicate];
    
    // 2. Полученный массив выведите в консоль.
    NSLog(@"2. Отфильтрованный массив: %@", filteredArray.description);
    
    // 3. Сделайте из полученного массива словарь, содержащий пары слово - количество букв в нём.
    NSDictionary *dictionary = [self createDictionaryFromStringArray:filteredArray];
    NSLog(@"3. Словарь: %@", dictionary.description);
}

// Принимает массив, проверяет, является ли объект String и возвращает словарь "Слово : кол-во букв"
- (NSMutableDictionary *)createDictionaryFromStringArray:(NSArray *)array
{
    NSMutableDictionary *newDictionary = [NSMutableDictionary dictionary];
    for (NSObject *object in array)
    {
        if ([object isKindOfClass:[NSString class]])
        {
            NSString *string = (NSString *)object;
            [newDictionary setValue:@(string.length) forKey:string];
        }
    }
    return newDictionary;
}


@end
