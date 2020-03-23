#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSInteger h = [hours integerValue];
    NSInteger m = [minutes integerValue];
    
    if ([self isValidTimeHours:h minutes:m]) {
        switch (m) {
            case 0:
                return [NSString stringWithFormat:@"%@ o' clock", [self convertNumberToText:h]];
                break;
            case 15:
                return [NSString stringWithFormat:@"quarter past %@", [self convertNumberToText:h]];
                break;
            case 45:
                return [NSString stringWithFormat:@"quarter to %@", [self convertNumberToText:h+1]];
                break;
            case 30:
                return [NSString stringWithFormat:@"half past %@", [self convertNumberToText:h]];
                break;
            default:
                if (m < 30) {
                    return [NSString stringWithFormat:@"%@ minutes past %@", [self convertNumberToText:m], [self convertNumberToText:h]];
                }
                if (m > 30) {
                    return [NSString stringWithFormat:@"%@ minutes to %@", [self convertNumberToText:60-m], [self convertNumberToText:h+1]];
                }
                break;
        }
    }
    
    return @"";
}

- (NSString*)convertNumberToText:(NSInteger)number {
    NSArray *digits1_9 = @[@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine"];
    NSArray *digits10_19 = @[@"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen"];
    
    switch (number / 10) {
        case 0:
            return digits1_9[number-1];
            break;
        case 1:
            return digits10_19[number % 10];
        case 2:
            if (number == 20) {
                return @"twenty";
            }
            return [NSString stringWithFormat:@"twenty %@", digits1_9[number % 10 - 1]];
        default:
            break;
    }
    return @"";
}

- (BOOL)isValidTimeHours:(NSInteger)hours minutes:(NSInteger)minutes {
    if (hours < 0 || hours > 12 || minutes < 0 || minutes > 59) {
        return false;
    }
    return true;
}

@end
