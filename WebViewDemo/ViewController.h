//
//  ViewController.h
//  WebViewDemo
//
//  Created by Nagam Pawan on 9/20/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *myWebView;
- (IBAction)backButton:(id)sender;

@end

