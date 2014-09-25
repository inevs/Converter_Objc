//
//  OCHamcrest - HCUnsignedLongLongReturnGetter.h
//  Copyright 2014 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Docs: http://hamcrest.github.com/OCHamcrest/
//  Source: https://github.com/hamcrest/OCHamcrest
//

#import "HCReturnValueGetter.h"


@interface HCUnsignedLongLongReturnGetter : HCReturnValueGetter

- (instancetype)initWithSuccessor:(HCReturnValueGetter *)successor;

@end
