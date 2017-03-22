//
//  ViewController.m
//  TestWindow
//
//  Created by EricChien on 2017/3/22.
//  Copyright © 2017年 Soul. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIWindow *tempWindow;
@property (nonatomic, strong) UIWindow *defaultWindow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)openWindow:(id)sender {
    [self getCurrentWindow];
    
    if (nil == _tempWindow) {
        
        _tempWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _tempWindow.backgroundColor = [UIColor redColor];
        
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeButton setFrame:CGRectMake( 0, 0, 50, 50)];
        [closeButton addTarget:self action:@selector(closeWindow:) forControlEvents:UIControlEventTouchUpInside];
        closeButton.backgroundColor = [UIColor yellowColor];
        [_tempWindow addSubview:closeButton];
    }
    
    [_defaultWindow resignKeyWindow];
    [_tempWindow setWindowLevel:UIWindowLevelStatusBar + 1.0];
    [_tempWindow makeKeyAndVisible];
}

- (void)closeWindow:(id)sender {
    if (_tempWindow != nil) {
        [_tempWindow resignKeyWindow];
    }
    if (_defaultWindow != nil) {
        [_tempWindow makeKeyAndVisible];
    }
}

#pragma mark - 取得Publisher目前的Window
- (void) getCurrentWindow {
    _defaultWindow = _defaultWindow != nil ? [[UIApplication sharedApplication] keyWindow] : [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    if (![_defaultWindow isMemberOfClass:[UIWindow class]]) {
        NSInteger count = [[[UIApplication sharedApplication] windows] count];
        while (count >= 0) {
            _defaultWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:count];
            if ([_defaultWindow isMemberOfClass:[UIWindow class]]) {
                break;
            }
            count--;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
