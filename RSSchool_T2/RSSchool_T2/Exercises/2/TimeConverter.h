#import <Foundation/Foundation.h>

@interface TimeConverter : NSObject
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes;
- (NSString*)convertNumberToText:(NSInteger)number;
- (BOOL)isValidTimeHours:(NSInteger)hours minutes:(NSInteger)minutes;
@end
