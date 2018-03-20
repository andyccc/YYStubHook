//
//  UIWindow+CallRecordShake.m
//  YYStubHook
//
//  Created by yans on 2018/3/20.
//

#ifdef __arm64__

#import "UIWindow+CallRecordShake.h"
#import "TimeProfilerVC.h"

@implementation UIWindow (CallRecordShake)

- (BOOL)canBecomeFirstResponder {
    return YES;
}


- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    TimeProfilerVC *vc = [[TimeProfilerVC alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.rootViewController presentViewController:vc animated:YES completion:nil];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
}

@end

#endif
