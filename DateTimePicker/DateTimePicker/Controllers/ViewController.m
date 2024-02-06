//
//  ViewController.m
//  DateTimePicker
//
//  Created by Sakshi Patil on 05/02/2024.
//

#import "ViewController.h"
#import "DateTimePicker-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Start button
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    startButton.backgroundColor = UIColor.blueColor;
    startButton.frame = CGRectMake(100, 100, 100, 50);
    startButton.center = self.view.center;
    startButton.layer.cornerRadius = 10;
    [startButton setTitle:@"Start" forState:UIControlStateNormal ];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(presentSwiftUIView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
}

// Presents DateTimePicker using `SwiftUIViewWrapper`
- (void)presentSwiftUIView:(UIButton *)sender {
    UIViewController *swiftUIViewController = [SwiftUIViewWrapper createSwiftUIView];
    [self presentViewController:swiftUIViewController animated:YES completion:nil];
}

@end
