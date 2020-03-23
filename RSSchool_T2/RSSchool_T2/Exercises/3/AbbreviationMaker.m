#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSMutableString *bStr = [NSMutableString stringWithString:b];
    
    for (NSInteger i = 0; i < [bStr length]; i++) {
        unichar character = [bStr characterAtIndex:i];
        if ([a localizedStandardContainsString:[NSString stringWithCharacters:&character length:1]]) {
            [bStr deleteCharactersInRange:NSMakeRange(i, 1)];
            i--;
        }
    }
    
    if ([bStr length] == 0) {
        return @"YES";
    }
    return @"NO";
}
@end
