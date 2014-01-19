#ifndef __LP64__

#import "TouchFix.h"

#import <objc/runtime.h>

@interface @@PROJECTNAME@@__GSEvent : NSObject {
@public
    unsigned int flags;
    unsigned int type;
    unsigned int ignored1;
    float x1;
    float y1;
    float x2;
    float y2;
    unsigned int ignored2[10];
    unsigned int ignored3[7];
    float sizeX;
    float sizeY;
    float x3;
    float y3;
    unsigned int ignored4[3];
}

@end

@implementation @@PROJECTNAME@@__GSEvent

@end


@interface UIEvent ()

- (id)_initWithEvent:(@@PROJECTNAME@@__GSEvent *)fp8 touches:(id)fp12;

@end


@implementation UITouch (@@PROJECTNAME@@__TouchFix)

- (instancetype)initWithPoint:(CGPoint)point andView:(UIView *)view {
    self = [super init];
    if (self) {
        CGRect frameInWindow;
        
        if ([view isKindOfClass:[UIWindow class]]) {
            frameInWindow = view.frame;
        }
        else {
            frameInWindow = [view.window convertRect:view.frame fromView:view.superview];
        }
         
        _tapCount = 1;
        _locationInWindow = point;
        _previousLocationInWindow = _locationInWindow;
        UIView *target = [view.window hitTest:_locationInWindow withEvent:nil];
#if !__has_feature(objc_arc)
        _view = [target retain];
        _window = [view.window retain];
#else
        _view = target;
        _window = view.window;
#endif
        _phase = UITouchPhaseBegan;
        _touchFlags._firstTouchForView = 1;
        _touchFlags._isTap = 1;
        _timestamp = [NSDate timeIntervalSinceReferenceDate];
    }
    return self;
}

@end

@implementation UIEvent (@@PROJECTNAME@@__TouchFix)

- (instancetype)initWithTouch:(UITouch *)touch {
    CGPoint location = [touch locationInView:touch.window];
    
    @@PROJECTNAME@@__GSEvent *gsEventProxy = [[@@PROJECTNAME@@__GSEvent alloc] init];
    
    gsEventProxy->x1 = location.x;
    gsEventProxy->y1 = location.y;
    gsEventProxy->x2 = location.x;
    gsEventProxy->y2 = location.y;
    gsEventProxy->x3 = location.x;
    gsEventProxy->y3 = location.y;
    gsEventProxy->sizeX = 1.0f;
    gsEventProxy->sizeY = 1.0f;
    gsEventProxy->flags = ([touch phase] == UITouchPhaseEnded) ? 0x1010180 : 0x3010180;
    gsEventProxy->type = 3001;
    
#if !__has_feature(objc_arc)
    [self release];
#endif
    
    self = nil;
    
    self = [[objc_getClass("UITouchesEvent") alloc] _initWithEvent:gsEventProxy touches:[NSSet setWithObject:touch]];
    
#if !__has_feature(objc_arc)
    [gsEventProxy release];
#endif
    
    return self;
}

@end

#endif

