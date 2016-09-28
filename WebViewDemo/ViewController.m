//
//  ViewController.m
//  WebViewDemo
//
//  Created by Nagam Pawan on 9/20/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myWebView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = false;
    _barBtn.enabled = false;
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple2.com"]]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication]. networkActivityIndicatorVisible = YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication]. networkActivityIndicatorVisible = NO;
    _barBtn.enabled = _myWebView.canGoBack;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error Loading" message:@"Website not Found" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancel];
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
    [UIApplication sharedApplication]. networkActivityIndicatorVisible = NO;
}
- (IBAction)backButton:(id)sender {
    if ([_myWebView canGoBack]) {
        _barBtn.enabled = YES;
    [_myWebView goBack];
    }
}
@end
