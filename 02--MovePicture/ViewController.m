//
//  ViewController.m
//  02--MovePicture
//
//  Created by Rainer on 15/10/29.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"

/**
 *  定义一个枚举类型来表示操作按钮的tag值
 */
typedef enum {
    TodoButtonTypeUp = 100, // 上
    TodoButtonTypeLeft,     // 左
    TodoButtonTypeDown,     // 下
    TodoButtonTypeRight,    // 右
    TodoButtonTypeBig,      // 放大
    TodoButtonTypeTurnLeft, // 左转
    TodoButtonTypeMall,     // 缩小
    TodoButtonTypeTurnRight // 右转
}TodoButtonType;

/** 定义一个常量用来定义缩放尺寸 */
#define kSizeZoom 10.0
#define kMovePadding 10

@interface ViewController ()

/** 头像按钮 */
@property (weak, nonatomic) IBOutlet UIButton *iconPicture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 *  上下左右移动按钮事件
 */
- (IBAction)moveWithButton:(UIButton *)button {
    // 1.取出头像按钮的Frame
    CGRect iconPictureFrame = self.iconPicture.frame;
    
    // 2.根据tag判断按钮的操作，并作出相应的动作
    switch (button.tag) {
        case TodoButtonTypeUp:
            iconPictureFrame.origin.y -= kMovePadding;
            break;
        case TodoButtonTypeLeft:
            iconPictureFrame.origin.x -= kMovePadding;
            break;
        case TodoButtonTypeDown:
            iconPictureFrame.origin.y += kMovePadding;
            break;
        case TodoButtonTypeRight:
            iconPictureFrame.origin.x += kMovePadding;
            break;
    }
    
    // 3.将重新设置的frame重新赋值给头像
    // 3.1.加上收尾式动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:1.0];
    
    self.iconPicture.frame = iconPictureFrame;
    
    [UIView commitAnimations];
}

/**
 *  放大缩小按钮事件
 */
- (IBAction)zoomWithButton:(UIButton *)button {
    // 1.取出头像按钮的Frame
    CGRect iconPictureFrame = self.iconPicture.bounds;
    
    // 2.根据点击按钮的tag判断是什么操作，并作出反应
    switch (button.tag) {
        case TodoButtonTypeBig:
            iconPictureFrame.size.height += kSizeZoom;
            iconPictureFrame.size.width += kSizeZoom;
            break;
        case TodoButtonTypeMall:
            iconPictureFrame.size.height -= kSizeZoom;
            iconPictureFrame.size.width -= kSizeZoom;
            break;
        default:
            break;
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:1.0];
    
    self.iconPicture.bounds = iconPictureFrame;

    [UIView commitAnimations];
}

@end
