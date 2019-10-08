//
//  ZHXSegmentBarView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/10/8.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "ZHXSegmentBarView.h"
#import "ZXSegmentItemView.h"
#import "NSString+ZTSize.h"
#import "UIColor+Extension.h"
static NSInteger const ITEM_TAG = 1000;

@interface ZHXSegmentBarView()
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic, strong) UIView *line;
@end
@implementation ZHXSegmentBarView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        //要先初始化view
        [self initView];
        self.titles = titles;
        
    }
    return self;
}
- (void)initView{
    /*
    self.horizontalMargin = 0;
    self.fontSize = 14;
    self.lineColor = [UIColor blackColor];
     */
    [self setUpView];
}

- (void)setUpView{
    [self addSubview:self.contentView];
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(self.topMargin);
        make.bottom.equalTo(self.mas_bottom).offset(-self.bottomMargin);
        make.left.equalTo(self.mas_left).offset(self.horizontalMargin);
        make.right.equalTo(self.mas_right).offset(-self.horizontalMargin);
        
    }];

    [self layoutAllView];
}
- (void)layoutAllView{
    
}
#pragma mark - Setter Method
- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    [self initContentView];
}
- (void)setHorizontalMargin:(float)horizontalMargin{
    _horizontalMargin = horizontalMargin;
    [self updateContentView];

}
- (void)setTopMargin:(float)topMargin{
    _topMargin =topMargin;
    [self updateContentView];

}
- (void)setBottomMargin:(float)bottomMargin{
    _bottomMargin =bottomMargin;
    [self updateContentView];
}

- (void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
    if (_selectIndex>=_titles.count) {
        return;
    }
    [self updateContentView];
}
- (void)setFontSize:(float)fontSize
{
    _fontSize = fontSize;
    [self updateContentView];
}
- (void)setItemBackColor:(UIColor *)itemBackColor{
    _itemBackColor =itemBackColor;
    [self updateContentView];
}
- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    [self updateContentView];
}
- (void)setLinePadding:(float)linePadding{
    _linePadding = linePadding;
    [self updateContentView];
}
- (void)setItemColor:(UIColor *)itemColor{
    _itemColor = itemColor;
    [self updateContentView];

}
- (void)setItemSelctedColor:(UIColor *)itemSelctedColor{
    _itemSelctedColor = itemSelctedColor;
    [self updateContentView];

}
#pragma mark - InitContentView
- (void)initContentView{
    float itemWidth = [self getItemWidth];
    float fontSize = 14;
    float itemX = 0;
    for (int i=0; i<_titles.count; i++) {
        NSString * title = [_titles objectAtIndex:i];
        ZXSegmentItemView *itemView = [[ZXSegmentItemView alloc]init];
        [self.contentView addSubview:itemView];
        itemView.backgroundColor = [UIColor whiteColor];
        itemView.tag = ITEM_TAG+i;
        [itemView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(itemX);
            make.top.bottom.equalTo(self.contentView);
            make.width.mas_equalTo(itemWidth);
        }];
        itemView.label.text = title;
        itemView.label.font = [UIFont systemFontOfSize:fontSize];
        itemX = itemX+itemWidth;
//        itemView.line.backgroundColor = (self.selectIndex==i) ?self.lineColor:[UIColor clearColor];
        [itemView addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
       self.line = [[UIView alloc]init];
       [self.contentView addSubview:self.line];
       ZXSegmentItemView *itemView = [self.contentView viewWithTag:ITEM_TAG+0];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom);
            make.centerX.equalTo(itemView.mas_centerX);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(3);
        }];
        self.line.backgroundColor = self.lineColor ? self.lineColor:[UIColor clearColor];
        self.line.layer.cornerRadius = 1.5;
}
#pragma mark - Update Method
- (void)updateContentView{
    float itemWidth = [self getItemWidth];
    float fontSize = [self getFontSize];
    float itemX = 0;
//    BOOL  isAddjusmentSize = [self isAddjustFontSize];
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(self.topMargin);
        make.bottom.equalTo(self.mas_bottom).offset(-self.bottomMargin);
        make.left.equalTo(self.mas_left).offset(self.horizontalMargin);
        make.right.equalTo(self.mas_right).offset(-self.horizontalMargin);
        
    }];
    for (int i=0; i<_titles.count; i++) {
        NSString * title = [_titles objectAtIndex:i];
        ZXSegmentItemView *itemView = [self.contentView viewWithTag:ITEM_TAG+i];
        [itemView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(itemX);
            make.top.bottom.equalTo(self.contentView);
            make.width.mas_equalTo(itemWidth);
        }];
        itemView.backgroundColor = self.itemBackColor;
        itemX = itemX+itemWidth;
        itemView.label.text = title;
        itemView.label.font = [UIFont systemFontOfSize:fontSize];
        itemView.label.textColor = (self.selectIndex==i) ?self.itemSelctedColor:self.itemColor;
//        itemView.line.backgroundColor = (self.selectIndex==i) ?self.lineColor:[UIColor clearColor];
        float textWidth = [self getTextWidth:title];
        [itemView.label mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(textWidth);
        }];
//        [itemView.line mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(MIN(textWidth, itemWidth) -2*self.linePadding);
//        }];

    }
    self.line.backgroundColor = self.lineColor ? self.lineColor:[UIColor clearColor];
}
#pragma mark - Public Method
- (void)showBadgeAtIndex:(NSInteger)index title:(NSString *)title badgeStyle:(NSDictionary *)badgeStyleDict{
    if (index>=_titles.count||!title) {
        return;
    }
    float size = [badgeStyleDict[@"textSize"] floatValue]>0 ? [badgeStyleDict[@"textSize"] floatValue] :0;
    NSString *backColor = !badgeStyleDict[@"backColor"]?badgeStyleDict[@"backColor"]:@"";
    NSString *textColor = !badgeStyleDict[@"textColor"]?badgeStyleDict[@"textColor"]:@"";
    for (int i=0; i<_titles.count; i++) {
        ZXSegmentItemView *itemView = [self.contentView viewWithTag:ITEM_TAG+i];
        if (index==i) {
            itemView.badge.hidden = NO;
            itemView.badge.backgroundColor = backColor.length>0 ? [UIColor colorWithString:backColor]:[UIColor orangeColor];
            [itemView.badge setTitleColor:(textColor.length>0?[UIColor colorWithString:textColor] : [UIColor whiteColor]) forState:UIControlStateNormal];

            [itemView.badge setTitle:title forState:UIControlStateNormal];
            itemView.badge.titleLabel.font = [UIFont systemFontOfSize:(size >0?size:[self getBadgeFontSizeWithTitle:title])];
            [self.contentView bringSubviewToFront:itemView];
        }else{
            itemView.badge.hidden = YES;
            [self.contentView sendSubviewToBack:itemView];
//            [self bringSubviewToFront:itemView];

        }
    }
}
#pragma mark - Touch Method
- (void)clickItem:(id)sender
{
    UIControl *control = sender;
    if(control.selected)
    {
        return;
    }
    NSInteger tag = control.tag;
    self.selectIndex = tag-ITEM_TAG;
       ZXSegmentItemView *itemView = [self.contentView viewWithTag:tag];
//        [self.line mas_updateConstraints:^(MASConstraintMaker *make) {
//                 make.centerX.equalTo(itemView.mas_centerX);
//        }];
    [self.line.superview setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.15 animations:^{
        [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom);
            make.centerX.equalTo(itemView.mas_centerX);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(3);
        }];
        [self.line.superview layoutIfNeeded];

    }];
       
    [self updateContentView];
 
    //todo:weak
    if (self.indexChangeBlock) {
        self.indexChangeBlock(self.selectIndex);
    }
}
#pragma mark - Private Method
- (float)getBadgeFontSizeWithTitle:(NSString *)title{
    float width = [title getTheTextWidthWithFont:[UIFont systemFontOfSize:10] height:15]+1;
    if (width>33-7) {
        return 8;
    }else{
        return 10;
    }
    return 10;
}
- (float)getFontSize{
    NSArray *sortedArray = [self.titles sortedArrayUsingComparator:^NSComparisonResult(NSString * obj1, NSString *  obj2) {
        //这里的代码可以参照上面compare:默认的排序方法，也可以把自定义的方法写在这里，给对象排序
        NSComparisonResult result = [@(obj2.length) compare:@(obj1.length)];
        return result;
    }];
    
    NSString *longText =  [sortedArray firstObject];
    float itemWidth = [self getItemWidth];
    float textWidth = [self getTextWidth:longText];
    if (itemWidth>=textWidth) {
        return self.fontSize;
    }else{
        return self.fontSize-3;
    }
    return 14;
}
- (BOOL)isAddjustFontSize{
    NSArray *sortedArray = [self.titles sortedArrayUsingComparator:^NSComparisonResult(NSString * obj1, NSString *  obj2) {
        //这里的代码可以参照上面compare:默认的排序方法，也可以把自定义的方法写在这里，给对象排序
        NSComparisonResult result = [@(obj2.length) compare:@(obj1.length)];
        return result;
    }];
    
    NSString *longText =  [sortedArray firstObject];
    float itemWidth = [self getItemWidth];
    float textWidth = [self getTextWidth:longText];
    if (itemWidth>=textWidth) {
        return NO;
    }else{
        return YES;
    }
}
- (float)getTextWidth:(NSString *)text{
    float width = [text getTheTextWidthWithFont:[UIFont systemFontOfSize:self.fontSize] height:17]+1;
    return width;
}
- (float)getItemWidth{
    float totalWidth = screen_width-self.horizontalMargin*2;
    float itemWidth = totalWidth/(float)self.titles.count;
    return itemWidth;
}
#pragma mark - Getter Method
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
    }
    return _contentView;
}

@end
