#ifndef __LP64__

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UITouch+Private.h"

@interface UIEvent (@@PROJECTNAME@@__TouchFix)

- (instancetype)initWithTouch:(UITouch *)touch;

@end

@interface UITouch (@@PROJECTNAME@@__TouchFix)

- (instancetype)initWithPoint:(CGPoint)point andView:(UIView *)view;

@end

#endif