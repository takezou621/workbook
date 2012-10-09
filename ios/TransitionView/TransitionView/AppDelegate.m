//
//  AppDelegate.m
//  TransitionView
//
//  Created by 村上 幸雄 on 12/09/29.
//  Copyright (c) 2012年 Bitz Co., Ltd. All rights reserved.
//

#include "MyViewController.h"
#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, assign) BOOL      isView1;
@property (nonatomic, strong) UIView    *view1;
@property (nonatomic, strong) UIView    *view2;
@property (strong, nonatomic) MyViewController  *myViewController1;
@property (strong, nonatomic) MyViewController  *myViewController2;
@end

@implementation AppDelegate

@synthesize isView1 = _isView1;
@synthesize view1 = _view1;
@synthesize view2 = _view2;
@synthesize myViewController1 = _myViewController1;
@synthesize myViewController2 = _myViewController2;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    DBGMSG(@"%s", __func__);
    
    CGRect  screenBounds = [[UIScreen mainScreen] applicationFrame];
    DBGMSG(@"screenBounds:(%f, %f, %f, %f)",
           screenBounds.origin.x,
           screenBounds.origin.y,
           screenBounds.size.width,
           screenBounds.size.height);
    CGRect  windowBounds = [[UIScreen mainScreen] bounds];
    DBGMSG(@"windowBounds:(%f, %f, %f, %f)",
           windowBounds.origin.x,
           windowBounds.origin.y,
           windowBounds.size.width,
           windowBounds.size.height);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    /*
    self.view1 = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view1.backgroundColor = [UIColor redColor];
    self.view2 = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view2.backgroundColor = [UIColor blueColor];
    
    [self.window addSubview:self.view2];

    self.isView1 = YES;
    [self.window addSubview:self.view1];
    */
    
    self.myViewController1 = [[MyViewController alloc] init];
    self.myViewController1.view.backgroundColor = [UIColor redColor];
    self.myViewController1.title = @"one";
    self.myViewController2 = [[MyViewController alloc] init];
    self.myViewController2.view.backgroundColor = [UIColor blueColor];
    self.myViewController2.title = @"two";
    
    self.isView1 = YES;
    self.window.rootViewController = self.myViewController1;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    DBGMSG(@"%s", __func__);
    if (self.isView1) {
        self.isView1 = NO;
        /*
        [self.window sendSubviewToBack:self.view1];
        //[self.window addSubview:self.view2];
        //[self.view1 removeFromSuperview];
        */
        self.window.rootViewController = self.myViewController2;
    }
    else {
        self.isView1 = YES;
        /*
        [self.window bringSubviewToFront:self.view1];
        //[self.window addSubview:self.view1];
        //[self.view2 removeFromSuperview];
        */
        self.window.rootViewController = self.myViewController1;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    DBGMSG(@"%s", __func__);
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    DBGMSG(@"%s", __func__);
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    DBGMSG(@"%s", __func__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    DBGMSG(@"%s", __func__);
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    DBGMSG(@"%s", __func__);
    self.view1 = nil;
    self.view2 = nil;
    self.myViewController1 = nil;
    self.myViewController2 = nil;
}

@end