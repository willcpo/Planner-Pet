//
//  HippoBodyStatusView.m
//  HippoPlay
//
//  Created by xlkd 24 on 2019/4/12.
//  Copyright © 2019 xlkd 24. All rights reserved.
//

#import "HippoBodyStatusView.h"
#import "HippoProgressView.h"


@interface HippoBodyStatusView ()
@property (nonatomic,assign)CGFloat mood;
@property (nonatomic,assign)CGFloat exp;
@property (nonatomic,assign)CGFloat food;
@property (nonatomic,assign)CGFloat clean;
@property (nonatomic,copy) void (^enterActionBlock)(NSInteger);
@property (nonatomic,strong) HippoProgressView *moodView;
@property (nonatomic,strong) HippoProgressView *expView;
@property (nonatomic,strong) HippoProgressView *foodView;
@property (nonatomic,strong) HippoProgressView *cleanView;
@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) UIButton *rightBtn;
@end

@implementation HippoBodyStatusView

- (instancetype)initWithMood:(CGFloat)mood andExp:(CGFloat)exp andFood:(CGFloat)food andClean:(CGFloat)clean enterAction:(void(^)(NSInteger))enterActionBlock {
    self = [super init];
    if (self) {
        self.mood = mood;
        self.exp = exp;
        self.food = food;
        self.clean = clean;
        [self summer_setupViews];
        [self summer_bindViewModel];
        [self configChangeUIWithData:mood andExpNumber:exp andFoodNumber:food andCleanNumber:clean];
        self.enterActionBlock = enterActionBlock;
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self summer_setupViews];
        [self summer_bindViewModel];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self summer_setupViews];
        [self summer_bindViewModel];
    }
    return self;
}

- (void)summer_bindViewModel {
    
}


- (void)summer_setupViews {
    
    self.backgroundColor = [UIColor clearColor];
    __weak typeof(self) weakSelf = self;
    [self addSubview:self.leftBtn];
    [self addSubview:self.rightBtn];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.right.equalTo(weakSelf.rightBtn.mas_left);
        make.width.equalTo(weakSelf.rightBtn.mas_width);
        make.height.mas_equalTo(STSizeWithWidth(100.0));
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.left.equalTo(weakSelf.leftBtn.mas_right);
        make.width.equalTo(weakSelf.leftBtn.mas_width);
        make.height.mas_equalTo(STSizeWithWidth(100.0));
    }];
    
    
    [self addSubview:self.moodView];
    [self addSubview:self.expView];
    [self addSubview:self.foodView];
    [self addSubview:self.cleanView];
    
    [self.expView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.leftBtn.mas_top);
        make.right.equalTo(weakSelf.moodView.mas_left);
        make.width.equalTo(weakSelf.moodView.mas_width);
        make.width.equalTo(weakSelf.foodView.mas_width);
        make.width.equalTo(weakSelf.cleanView.mas_width);
    }];
    
    [self.moodView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.expView.mas_right);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.leftBtn.mas_top);
        make.right.equalTo(weakSelf.cleanView.mas_left);
        make.width.equalTo(weakSelf.expView.mas_width);
        make.width.equalTo(weakSelf.cleanView.mas_width);
        make.width.equalTo(weakSelf.foodView.mas_width);
    }];
    
    [self.cleanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.moodView.mas_right);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.leftBtn.mas_top);
        make.right.equalTo(weakSelf.foodView.mas_left);
        make.width.equalTo(weakSelf.moodView.mas_width);
        make.width.equalTo(weakSelf.foodView.mas_width);
        make.width.equalTo(weakSelf.expView.mas_width);
    }];
    
    [self.foodView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.rightBtn.mas_top);
        make.left.equalTo(weakSelf.cleanView.mas_right);
        make.width.equalTo(weakSelf.moodView.mas_width);
        make.width.equalTo(weakSelf.cleanView.mas_width);
        make.width.equalTo(weakSelf.expView.mas_width);
    }];
    
}


- (void)clickBtnAction:(UIButton *)sender {
    
    if (self.enterActionBlock != nil) {
        self.enterActionBlock(sender.tag);
    }
}
- (void)clickProgressAction:(NSInteger)tag {
    if (self.enterActionBlock != nil) {
        self.enterActionBlock(tag);
    }
}
- (void)configChangeUIWithData:(CGFloat)moodNumber andExpNumber:(CGFloat)expNumber andFoodNumber:(CGFloat)foodNumber andCleanNumber:(CGFloat)cleanNumber {
    [self.moodView configChangeUiWithNumber:moodNumber];
    [self.expView configChangeUiWithNumber:expNumber];
    [self.foodView configChangeUiWithNumber:foodNumber];
    [self.cleanView configChangeUiWithNumber:cleanNumber];
}


#pragma mark - get
- (HippoProgressView *)moodView {
    if (!_moodView) {
        __weak typeof(self) weakSelf = self;
        _moodView = [[HippoProgressView alloc]initWithMood:self.mood andTitle:@"xinqingyiban" enterAction:^{
            //
            [weakSelf clickProgressAction:30];
        }];
        _moodView.backgroundColor = [UIColor clearColor];
    }
    return _moodView;
}
- (HippoProgressView *)expView {
    if (!_expView) {
        __weak typeof(self) weakSelf = self;
        _expView = [[HippoProgressView alloc]initWithMood:self.exp andTitle:@"jie" enterAction:^{
            [weakSelf clickProgressAction:40];
        }];
        _expView.backgroundColor = [UIColor clearColor];
    }
    return _expView;
}
- (HippoProgressView *)foodView {
    if (!_foodView) {
        __weak typeof(self) weakSelf = self;
        _foodView = [[HippoProgressView alloc]initWithMood:self.food andTitle:@"shiwu" enterAction:^{
            [weakSelf clickProgressAction:50];
        }];
        _foodView.backgroundColor = [UIColor clearColor];
    }
    return _foodView;
}
- (HippoProgressView *)cleanView
{
    if (!_cleanView) {
        __weak typeof(self) weakSelf = self;
        _cleanView = [[HippoProgressView alloc]initWithMood:self.food andTitle:@"shiwu" enterAction:^{
            [weakSelf clickProgressAction:60];
        }];
        _cleanView.backgroundColor = [UIColor clearColor];
    }
    return _cleanView;
}
- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc]init];
        [_leftBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//        [_leftBtn setTitle:@"playGame" forState:UIControlStateNormal];
        [_leftBtn setImage:[UIImage imageNamed:@"youxi"] forState:UIControlStateNormal];
//        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"youxi"] forState:UIControlStateNormal];
        _leftBtn.tag = 10;
    }
    return _leftBtn;
}
- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc]init];
        [_rightBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//        [_rightBtn setTitle:@"clear" forState:UIControlStateNormal];
        [_rightBtn setImage:[UIImage imageNamed:@"qingli"] forState:UIControlStateNormal];
//        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"qingli"] forState:UIControlStateNormal];
        _rightBtn.tag = 20;
    }
    return _rightBtn;
}
@end