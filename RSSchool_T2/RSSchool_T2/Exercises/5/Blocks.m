#import "Blocks.h"

@interface Blocks ()

@property(nonatomic) NSArray *array;

@end

@implementation Blocks

-(BlockA)blockA {
    __weak typeof(self) weakSelf = self;
    return ^(NSArray *arr){
        weakSelf.array = [arr copy];
    };
}

-(BlockB)blockB {
     __weak typeof(self) weakSelf = self;
    return self.blockB = ^(Class class) {
        NSMutableArray *array = [weakSelf.array mutableCopy];
        if (class == [NSNumber class]) {
            NSInteger result = 0;
            for (NSObject *obj in array) {
                if ([obj isKindOfClass:[NSNumber class]]) {
                    result += [(NSNumber *)obj integerValue];
                }
            }
            weakSelf.blockC([NSNumber numberWithInteger:result]);
        }
        if (class == [NSDate class]) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd.MM.yyyy"];
            
            NSDate *date = [NSDate new];
            for (NSObject *obj in array) {
                if ([obj isKindOfClass:[NSDate class]]) {
                    if ([date compare:(NSDate*)obj] == NSOrderedAscending) {
                        date = (NSDate*)obj;
                    }
                }
            }
            weakSelf.blockC([dateFormatter stringFromDate:date]);
        }
        if (class == [NSString class]) {
            NSMutableString *result = [NSMutableString new];
            for (NSObject *obj in array) {
                if ([obj isKindOfClass:[NSString class]]) {
                    [result appendString:(NSString *)obj];
                }
            }
            weakSelf.blockC([NSString stringWithString:result]);
        }
    };
}

@end

