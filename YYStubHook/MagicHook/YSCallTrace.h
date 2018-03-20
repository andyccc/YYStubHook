//
//  YSStaticLibCallTrace.h
//  YYStubHook
//
//  Created by yans on 2018/3/20.
//


#ifndef __arm64__

void stopTrace(void);
void setMaxDepth(int depth);
void setCostMinTime(uint64_t time);

#else

#ifndef YSCallTrace_h
#define YSCallTrace_h

#include <stdio.h>
#include <objc/objc.h>


typedef struct {
    Class cls;
    SEL sel;
    uint64_t costTime; //单位：纳秒（百万分之一秒）
    int depth;
} YSCallRecord;

typedef struct {
    YSCallRecord *record;
    int allocLength;
    int index;
} YSMainThreadCallRecord;

void stopTrace(void);
YSMainThreadCallRecord *getMainThreadCallRecord(void);
void setMaxDepth(int depth);
void setCostMinTime(uint64_t time);



#endif /* YSCallTrace_h */

#endif
