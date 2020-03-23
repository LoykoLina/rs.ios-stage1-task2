#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSInteger prev = 0;
    NSInteger n = 0;
    NSInteger index = 0;
    
    while (prev * n < [number integerValue]) {
        prev = [self fibonacci:index];
        n = [self fibonacci:++index];
    }
    return @[[NSNumber numberWithInteger:prev], [NSNumber numberWithInteger:n], prev * n == [number integerValue] ? @1 : @0 ];
}

- (NSInteger)fibonacci:(NSInteger)index {
    return index<2 ? index : [self fibonacci:index-1] + [self fibonacci:index-2];
}

@end
