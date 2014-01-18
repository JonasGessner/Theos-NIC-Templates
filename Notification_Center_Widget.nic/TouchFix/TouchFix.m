#ifndef __LP64__

#import <objc/runtime.h>

#import "TouchFix.h"


@interface SCEventProxy : NSObject {
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


@implementation SCEventProxy
@end



@implementation UITouch (@@PROJECTNAME@@_TouchFix)

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
        _view = target;
        _window = view.window;
        _phase = UITouchPhaseBegan;
        _touchFlags._firstTouchForView = 1;
        _touchFlags._isTap = 1;
        _timestamp = [NSDate timeIntervalSinceReferenceDate];
    }
    return self;
}

- (void)changeToPhase:(UITouchPhase)phase {
    _phase = phase;
    _timestamp = [NSDate timeIntervalSinceReferenceDate];
}

@end


@interface UIEvent ()

- (instancetype)_initWithEvent:(SCEventProxy *)fp8 touches:(id)fp12;

@end

@implementation UIEvent (@@PROJECTNAME@@_TouchFix)

- (instancetype)initWithTouch:(UITouch *)touch {
    CGPoint location = [touch locationInView:touch.window];
    SCEventProxy *eventProxy = [[SCEventProxy alloc] init];
    eventProxy->x1 = location.x;
    eventProxy->y1 = location.y;
    eventProxy->x2 = location.x;
    eventProxy->y2 = location.y;
    eventProxy->x3 = location.x;
    eventProxy->y3 = location.y;
    eventProxy->sizeX = 1.0;
    eventProxy->sizeY = 1.0;
    eventProxy->flags = ([touch phase] == UITouchPhaseEnded) ? 0x1010180 : 0x3010180;
    eventProxy->type = 3001;
    
    Class cls = objc_getClass("UITouchesEvent");
    
    self = [cls alloc];
    self = [self _initWithEvent:eventProxy touches:[NSSet setWithObject:touch]];
    return self;
}

@end

#endif
