//
//  Person.m
//  ForwardInvocationTest
//
//  Created by 刘艳芹 on 2019/5/24.
//  Copyright © 2019 刘艳芹. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)runTo:(NSString *)place{
    NSLog(@"%s %@",__func__,place);
}
@end
