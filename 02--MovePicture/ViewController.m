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

@interface ViewController ()

/** 头像按钮 */
@property (weak, nonatomic) IBOutlet UIButton *iconPicture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 *  按钮事件
 */
- (IBAction)todoButtonClickAction:(UIButton *)button {
    // 1.取出头像按钮的Frame
    CGRect iconPictureFrame = self.iconPicture.frame;
    
    // 2.根据点击按钮的tag判断是什么操作，并作出反应
    switch (button.tag) {
        case TodoButtonTypeUp:
            iconPictureFrame.origin.y -= 10;
            break;
        case TodoButtonTypeLeft:
            iconPictureFrame.origin.x -= 10;
            break;
        case TodoButtonTypeDown:
            iconPictureFrame.origin.y += 10;
            break;
        case TodoButtonTypeRight:
            iconPictureFrame.origin.x += 10;
            break;
        case TodoButtonTypeBig:
            iconPictureFrame.size.height += kSizeZoom;
            iconPictureFrame.size.width += kSizeZoom;
            break;
        case TodoButtonTypeMall:
            iconPictureFrame.size.height -= kSizeZoom;
            iconPictureFrame.size.width -= kSizeZoom;
            break;
        case TodoButtonTypeTurnLeft:
            
            break;
        case TodoButtonTypeTurnRight:
            
            break;
        default:
            break;
    }
    
    self.iconPicture.frame = iconPictureFrame;
}


@end
