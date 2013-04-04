//
//  ViewController.m
//  Cocos2d+StoryBoards
//
//  Created by Oguzhan Gungor on 3/04/13.
//  Copyright (c) 2013 Oguzhan Gungor. All rights reserved.
//

#import "ViewController.h"
#import "IntroLayer.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	CCDirector *director = [CCDirector sharedDirector];
    
    if([director isViewLoaded] == NO)
    {
        CCGLView *glView = [CCGLView viewWithFrame:[[[UIApplication sharedApplication] keyWindow] bounds]
                                       pixelFormat:kEAGLColorFormatRGB565
                                       depthFormat:0
                                preserveBackbuffer:NO
                                        sharegroup:nil
                                     multiSampling:NO
                                   numberOfSamples:0];
        
        director.view = glView;
        
        // Initialize other director settings.
        [director setAnimationInterval:1.0f/60.0f];
        [director enableRetinaDisplay:YES];
    }
    
    director.delegate = self;
    
    [self addChildViewController:director];
    
    [self.view addSubview:director.view];
    [self.view sendSubviewToBack:director.view];
    
    [director didMoveToParentViewController:self];
    
           [director runWithScene:[IntroLayer scene]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
