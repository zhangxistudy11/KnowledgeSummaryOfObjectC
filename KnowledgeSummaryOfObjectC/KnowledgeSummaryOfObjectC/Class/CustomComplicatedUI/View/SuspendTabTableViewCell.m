//
//  SuspendTabTableViewCell.m
//  KnowledgeSummaryOfObjectC
//
//  Created by 张玺 on 2020/7/20.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "SuspendTabTableViewCell.h"
#import "SlideTabView.h"
@interface SuspendTabTableViewCell()
@property (nonatomic,strong)SlideTabView *slideTabView;

@end
@implementation SuspendTabTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpView];
    }
    return self;
}
- (void)setUpView {
    [self.contentView addSubview:self.slideTabView];
}
-(SlideTabView *)slideTabView
{
    if (!_slideTabView) {
        _slideTabView = [[SlideTabView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 40)];
        _slideTabView.lineColor = [UIColor yellowColor];
        _slideTabView.itemColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        _slideTabView.itemSelctedColor = [UIColor whiteColor];
        _slideTabView.itemWidth = _slideTabView.bounds.size.width/3;
        _slideTabView.font = [UIFont boldSystemFontOfSize:18];
        _slideTabView.backgroundColor = [UIColor orangeColor];
        _slideTabView.titles = @[@"左边列表",@"中间列表",@"右边列表"];
        
        [_slideTabView makeItemSelectedBlock:^(NSInteger index) {
            if (self.clickTabBlock) {
                self.clickTabBlock(index);
            }
        }];
        
    }
    return _slideTabView;
}
@end
