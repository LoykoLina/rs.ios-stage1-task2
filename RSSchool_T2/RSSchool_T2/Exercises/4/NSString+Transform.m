#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    if ([[self stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return @"";
    }
    NSArray *words = [self componentsSeparatedByString:@" "];
    NSMutableArray *result = [NSMutableArray new];
    NSMutableCharacterSet *lowercaseSet = [NSMutableCharacterSet new];
    NSMutableCharacterSet *uppercaseSet = [NSMutableCharacterSet new];
    
    if ([self isPangram:self]) {
        [lowercaseSet addCharactersInString:@"aeuioy"];
        [uppercaseSet addCharactersInString:@"AEUIOY"];
    } else {
        [lowercaseSet addCharactersInString:@"qwrtpsdfghjklzxcvbnm"];
        [uppercaseSet addCharactersInString:@"QWRTPSDFGHJKLZXCVBNM"];
    }
    for (NSString *word in words) {
        if (![word isEqual:@""]) {
            NSMutableString *w = [word mutableCopy];
            int count = 0;
            for (NSInteger i = 0; i< [word length]; i++) {
                unichar character = [word characterAtIndex:i];
                if ([lowercaseSet characterIsMember:character]) {
                    unichar upperChar = [[[NSString stringWithCharacters:&character length:1] uppercaseString] characterAtIndex:0];
                    [w replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithCharacters:&upperChar length:1]];
                    count++;
                }
                if ([uppercaseSet characterIsMember:character]) {
                    count++;
                }
            }
            [result addObject:[NSString stringWithFormat:@"%d%@", count, w]];
        }
    }

    [result sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *a = (NSString *)obj1;
        NSString *b = (NSString *)obj2;
        return [a characterAtIndex:0] > [b characterAtIndex:0];
    }];
    return [result componentsJoinedByString:@" "];
}

-(BOOL)isPangram:(NSString*)str {
    NSString *alphabet = @"abcdefghijklmnopqrstuvwxyz";
    for (NSInteger i = 0; i < [alphabet length]; i++) {
        unichar character = [alphabet characterAtIndex:i];
        if (![str localizedCaseInsensitiveContainsString:[NSString stringWithCharacters:&character length:1]]) {
            return false;
        }
    }
    return true;
}

@end
