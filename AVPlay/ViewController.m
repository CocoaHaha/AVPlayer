//
//  ViewController.m
//  AVPlay
//
//  Created by SXF on 2017/3/24.
//  Copyright © 2017年 SXF. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface ViewController ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerViewController  *playerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 450, 100, 40);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"全屏播放" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"movie" ofType:@"mp4"];
//    NSURL *sourceMovieURL = [NSURL fileURLWithPath:filePath];
//    AVAsset *movieAsset
//    = [AVURLAsset URLAssetWithURL:sourceMovieURL options:nil];
//    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
//    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
//    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
//    playerLayer.frame = CGRectMake(0, 100, self.view.frame.size.width, 200);
//    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
//    [self.view.layer addSublayer:playerLayer];
//    [player play];
    
    //视频播放的url
    NSURL *playerURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"movie" ofType:@"mp4"]];
    
    //初始化
    self.playerView = [[AVPlayerViewController alloc]init];
    
    //AVPlayerItem 视频的一些信息  创建AVPlayer使用的
    AVPlayerItem *item = [[AVPlayerItem alloc]initWithURL:playerURL];
    
    //通过AVPlayerItem创建AVPlayer
    self.player = [[AVPlayer alloc]initWithPlayerItem:item];
    
    //给AVPlayer一个播放的layer层
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    
    layer.frame = CGRectMake(0, 100, self.view.frame.size.width, 200);
    
    layer.backgroundColor = [UIColor greenColor].CGColor;
    
    //设置AVPlayer的填充模式
    layer.videoGravity = AVLayerVideoGravityResize;
    
    [self.view.layer addSublayer:layer];
    [self.player play];
    
    //设置AVPlayerViewController内部的AVPlayer为刚创建的AVPlayer
//    self.playerView.player = self.player;
    
    //关闭AVPlayerViewController内部的约束
//    self.playerView.view.translatesAutoresizingMaskIntoConstraints = YES;

}
- (void)back{

    NSURL *playerURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"movie" ofType:@"mp4"]];
    AVPlayerViewController *player = [[AVPlayerViewController alloc]init];
    player.player = [[AVPlayer alloc]initWithURL:playerURL];
    [self presentViewController:player animated:YES completion:nil];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self showViewController:self.playerView sender:nil];

}

//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    
//    return UIInterfaceOrientationMaskLandscape;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
