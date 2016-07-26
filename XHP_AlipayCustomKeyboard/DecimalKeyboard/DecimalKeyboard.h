//
//  DecimalKeyboard.h
//  XHC_AlipayCustomKeyboard
//
//  Created by xiaohaiping on 16/7/26.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


#define BACKGROUNDCOLOR [UIColor colorWithRed:204 / 255.f green:204 / 255.f blue:204 / 255.f alpha:1.f]
#define TINTCOLOR [UIColor colorWithRed:0 / 255.f green:170 / 255.f blue:238 / 255.f alpha:1]

#define ITEM_BACKROUNDCOLOR_NORMAL [UIColor colorWithRed:250 / 255.f green:250 / 255.f blue:250 / 255.f alpha:1]

#define ITEM_BACKROUNDCOLOR_HIGHLIGHTED [UIColor colorWithRed:230 / 255.f green:230 / 255.f blue:230 / 255.f alpha:1]
#define DISMISS_TAG -4     //驳回
#define POINT_TAG  -3      //点
#define DELETE_TAG -2      //删除
#define DETERMINE_TAG -1   //确定
#define NUMBER_TAG 100

@interface DecimalKeyboard : UIView

@property (copy,nonatomic,nullable) void (^done)();
@property (nonatomic) UIColor *tintColor;

-(instancetype)initWithTintColor:(UIColor *)tintColor;

@end

@interface UIView (FindFirstResponder)

+ (UIView *)dk_firstResponder;

@end

@interface DecimalKeyboardItem : UIButton

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end

@interface DecimalKeyboard ()<UIInputViewAudioFeedback>
{
    NSTimer *deleteTimer;
}

@property (weak,nonatomic) UIView <UIKeyInput> *firstResponder;

@end

NS_ASSUME_NONNULL_END

