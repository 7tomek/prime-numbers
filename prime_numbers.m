//  Sieve of Eratosthenes
//  Created by Tomasz Pluciennik on 8/24/15.
//  Copyright (c) 2015 app. All rights reserved.

#import <Foundation/Foundation.h>

void printArray(NSArray *array) {
    for (NSNumber *num in array) {
        NSLog(@"%i", num.intValue);
    }
}

void findPrime(int divider, NSMutableArray *numbers, NSMutableArray *prime) {
    
    [prime addObject:@(divider)];
    for (int idx = 0; idx < numbers.count; idx++) {
        NSNumber *num = [numbers objectAtIndex:idx];
        if (num.intValue % divider == 0)
            [numbers removeObject:num];
    }
    
}

NSArray* findPrimeForRange(int range) {
    NSMutableArray *numbers = [NSMutableArray new];
    for (int i = 2; i < range; i++) {
        [numbers addObject:@(i)];
    }
    
    NSMutableArray *primeArray = [NSMutableArray new];
    NSNumber *divider = @2;
    while ((divider = [numbers firstObject]) != nil) {
        findPrime(divider.intValue, numbers, primeArray);
    }
    return primeArray;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printArray(findPrimeForRange(121));
    }
    return 0;
}
