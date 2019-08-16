//
//  ZTFlightTabBarView.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2019/8/16.
//  Copyright © 2019 张玺. All rights reserved.
//

#import "ZTFlightTabBarView.h"
#import "ZTFlightTabSingleItemView.h"
#import "NSString+ZTSize.h"

static NSInteger const ITEM_TAG = 1000;

@interface  ZTFlightTabBarView()
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,assign) NSInteger selectIndex;

@end

@implementation ZTFlightTabBarView
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
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
//    for (int i=0; i<_titles.count; i++) {
//        NSString * title = [_titles objectAtIndex:i];
//        float itemWidth =
//    }
    
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

- (void)setFontSize:(float)fontSize
{
    _fontSize = fontSize;
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
    //[self getFontSize];
    float itemX = 0;
    for (int i=0; i<_titles.count; i++) {
        NSString * title = [_titles objectAtIndex:i];
        ZTFlightTabSingleItemView *itemView = [[ZTFlightTabSingleItemView alloc]init];
        [self.contentView addSubview:itemView];
        itemView.backgroundColor = RandomColor;
        itemView.tag = ITEM_TAG+i;
        [itemView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(itemX);
            make.top.bottom.equalTo(self.contentView);
            make.width.mas_equalTo(itemWidth);
        }];
        itemView.label.text = title;
        itemView.label.font = [UIFont systemFontOfSize:fontSize];
        itemX = itemX+itemWidth;
        itemView.line.backgroundColor = (self.selectIndex==i) ?self.lineColor:[UIColor clearColor];
        [itemView addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
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
        ZTFlightTabSingleItemView *itemView = [self.contentView viewWithTag:ITEM_TAG+i];
        [itemView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(itemX);
            make.top.bottom.equalTo(self.contentView);
            make.width.mas_equalTo(itemWidth);
        }];
        itemX = itemX+itemWidth;
        itemView.label.text = title;
        itemView.label.font = [UIFont systemFontOfSize:fontSize];
        itemView.label.textColor = (self.selectIndex==i) ?self.itemSelctedColor:self.itemColor;
        itemView.line.backgroundColor = (self.selectIndex==i) ?self.lineColor:[UIColor clearColor];
        [itemView.label mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(itemWidth);
        }];
        float textWidth = [self getTextWidth:title];
        [itemView.line mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(MIN(textWidth, itemWidth) -2*self.linePadding);
        }];
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
    [self updateContentView];
    //todo:weak
    if (self.indexChangeBlock) {
        self.indexChangeBlock(self.selectIndex);
    }
}
#pragma mark - Private Method
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
        _contentView.backgroundColor = [UIColor redColor];
    }
    return _contentView;
}
@end
