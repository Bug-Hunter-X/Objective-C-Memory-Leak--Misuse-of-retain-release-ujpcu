The solution involves using `@property` with `nonatomic, strong` (in modern Objective-C) or `nonatomic, copy` if you want to make a copy of the assigned string, and removing manual memory management.  ARC (Automatic Reference Counting) is preferred where possible.  However, if you aren't using ARC, ensure the external assignment is properly released:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *myString; // Use strong or copy
@end

@implementation MyClass
// dealloc is not needed with ARC
@end

// ... elsewhere in your code ...
MyClass *myObject = [[MyClass alloc] init];
myObject.myString = [NSString stringWithString:@"Hello"]; // Use alloc if you really want to manage memory manually. Otherwise, use stringWithString for easier memory management.
[myObject release];
```

**With ARC:** The compiler manages memory automatically, eliminating the need for explicit `retain`, `release`, and `autorelease`. The `strong` keyword indicates that the object should be retained as long as the `myObject` exists.