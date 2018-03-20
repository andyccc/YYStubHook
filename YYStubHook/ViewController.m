//
//  ViewController.m
//  YYStubHook
//
//  Created by yans on 2018/3/20.
//

#import "ViewController.h"
#import "testlib/staticLib_arm64.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    staticLib_arm64 *obj = [staticLib_arm64 new];
    [obj method1];
    [obj method2];
}


@end
