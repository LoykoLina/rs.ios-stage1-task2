#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setDateFormat:@"d/M/yyyy"];
    
    NSString *dateStr = [NSString stringWithFormat:@"%@/%@/%@", day, month, year];
    NSDate *date = [dateFormatter dateFromString:dateStr];

    [dateFormatter setDateFormat:@"d MMMM, EEEE"];
    NSString *txtForDay = [dateFormatter stringFromDate:date];
    return txtForDay ? txtForDay : @"Такого дня не существует";
}

@end
