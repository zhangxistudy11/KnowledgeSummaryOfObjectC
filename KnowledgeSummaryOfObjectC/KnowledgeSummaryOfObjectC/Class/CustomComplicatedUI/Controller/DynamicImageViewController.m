//
//  DynamicImageViewController.m
//  KnowledgeSummaryOfObjectC
//
//  Created by zhangxi on 2017/10/24.
//  Copyright © 2017年 张玺. All rights reserved.
//

#import "DynamicImageViewController.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
@interface DynamicImageViewController ()
@property (nonatomic,strong) FLAnimatedImageView * imageVOne;
@end

@implementation DynamicImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self test1];
}
- (void)test1
{
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif"]]];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    imageView.frame = CGRectMake(20.0, 100.0, 100.0, 100.0);
    [self.view addSubview:imageView];

    imageView.loopCompletionBlock = ^(NSUInteger loopCountRemaining) {
        //[imageView stopAnimating];
    };
    
    //NSURL *url = [[NSBundle mainBundle] URLForResource:@"Speed_Gif" withExtension:@"gif"];
   // NSString *filePath = [[NSBundle mainBundle] pathForResource:@"aaa" ofType:@"png"];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Speed_Gif" ofType:@"gif"];

    //NSString *filePath = [[NSBundle mainBundle] pathForResource:@"aaa" ofType:@"png" inDirectory:@"Html"];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    NSData *data =[NSData dataWithContentsOfURL:[NSURL fileURLWithPath:filePath]];
    FLAnimatedImage *imaget = [[FLAnimatedImage alloc] initWithAnimatedGIFData:data];
    self.imageVOne = [[FLAnimatedImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    self.imageVOne.animatedImage = imaget;
    [self.view addSubview:self.imageVOne];
    [self.imageVOne startAnimating];
    @weakify(self);
    self.imageVOne.loopCompletionBlock = ^(NSUInteger loopCountRemaining) {
        @strongify(self);
        [self.imageVOne stopAnimating];
    };
}
@end
