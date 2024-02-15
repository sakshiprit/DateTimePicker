//
//  ViewController.m
//  DateTimePicker
//
//  Created by Sakshi Patil on 05/02/2024.
//

#import "ViewController.h"
#import "DateTimePicker-Swift.h"

@interface ViewController ()

@property (strong, nonatomic) UITextView *welcomeTextView;
@property (strong, nonatomic) StartViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[StartViewModel alloc] init];
    
    [self welcomeText];
    
    [self startButton];
    
    self.view.backgroundColor  = UIColor.blackColor;
}

/// Start button view
- (void)startButton {
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

/// Welcome text view
- (void)welcomeText {
    self.welcomeTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, self.view.center.y - 140, self.view.bounds.size.width - 40, 100)];
    self.welcomeTextView.backgroundColor = [UIColor clearColor];
    self.welcomeTextView.textAlignment = NSTextAlignmentCenter;
    self.welcomeTextView.editable = NO;
    self.welcomeTextView.font = [UIFont systemFontOfSize:24];
    self.welcomeTextView.textColor = [UIColor whiteColor];
    self.welcomeTextView.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);
    [self.view addSubview:self.welcomeTextView];
}

// Action to be performed when view appears.
-(void)viewWillAppear:(BOOL)animated {
    self.welcomeTextView.text = [self.viewModel getWelcomeMessageFor:@"Sakshi"];
}

// Presents DateTimePicker using `SwiftUIViewWrapper`
- (void)presentSwiftUIView:(UIButton *)sender {
    UIViewController *swiftUIViewController = [SwiftUIViewWrapper createSwiftUIView];
    swiftUIViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:swiftUIViewController animated:YES completion:nil];
}

@end
