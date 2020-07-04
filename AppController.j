/*
 * AppController.j
 * SwapViewTest
 *
 * Created by David Richardson on July 3, 2020.
 * Copyright 2020, David Richardson All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>

@import "FirstSubViewController.j"
@import "SecondSubViewController.j"

@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow;
    @outlet CPSplitView splitView @accessors;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
    [CPMenu setMenuBarVisible:NO];
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];
}

- (IBAction)loadFirstSubview:(id)sender
{
    var firstSubviewController = [[FirstSubViewController alloc] initWithCibName:@"FirstSubView" bundle:[CPBundle mainBundle]];
    var viewToSwapIn = [firstSubviewController view];
    var targetView = [[[self splitView] subviews] objectAtIndex:1];
    [[self splitView] replaceSubview:targetView with:viewToSwapIn];
    [targetView setNeedsDisplay:YES];
    console.log("Load first subview", targetView, viewToSwapIn);
}

- (IBAction)loadSecondSubview:(id)sender
{
    var secondSubviewController = [[SecondSubViewController alloc] initWithCibName:@"SecondSubView" bundle:[CPBundle mainBundle]];
    var viewToSwapIn = [secondSubviewController view];
    var targetView = [[[self splitView] subviews] objectAtIndex:1];
    [[self splitView] replaceSubview:targetView with:viewToSwapIn];
    [targetView setNeedsDisplay:YES];
    console.log("Load second subview", targetView, viewToSwapIn);    
}
@end
