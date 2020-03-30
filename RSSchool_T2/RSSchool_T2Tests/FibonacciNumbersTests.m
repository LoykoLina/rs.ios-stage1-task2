#import <XCTest/XCTest.h>
#import "FibonacciResolver.h"

@interface FibonacciNumbersTests : XCTestCase
@property (strong, nonatomic) FibonacciResolver* resolver;
@end

@implementation FibonacciNumbersTests

- (void)setUp {
    self.resolver = [FibonacciResolver new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testResolver1 {
    NSArray *result = [self.resolver productFibonacciSequenceFor:@714];
    NSArray *expectedValue = @[@21, @34, @1];
    XCTAssertEqualObjects(result, expectedValue);
}

- (void)testResolver2 {
    NSArray *result = [self.resolver productFibonacciSequenceFor:@800];
    NSArray *expectedValue = @[@34, @55, @0];
    XCTAssertEqualObjects(result, expectedValue);
}

- (void)testResolver3 {
    NSArray *result = [self.resolver productFibonacciSequenceFor:@40];
    NSArray *expectedValue = @[@5, @8, @1];
    XCTAssertEqualObjects(result, expectedValue);
}

- (void)testResolver4 {
    NSArray *result = [self.resolver productFibonacciSequenceFor:@100];
    NSArray *expectedValue = @[@8, @13, @0];
    XCTAssertEqualObjects(result, expectedValue);
}



@end
