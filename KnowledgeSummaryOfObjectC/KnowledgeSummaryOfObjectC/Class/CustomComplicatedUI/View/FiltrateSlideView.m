//
//  FiltrateSlideView.m
//  Leadfund
//
//  Created by zhangxi on 2018/1/29.
//

#import "FiltrateSlideView.h"
//距屏幕边缘临界距离
#define Default_LeftPadding 55
//动画时间
#define Duration 0.25
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
//透明度临界值
#define Deafult_Alpha 0.5
//滑动速度快慢分别临界值
#define Min_Pan_Speed 300
//背景色渐变行程占屏幕比
#define Distance_Scale 0.4
@interface FiltrateSlideView()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIView *shadowBGView;//背景View

@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;//拖拽手势

@property (nonatomic,assign) CGPoint orginPoint;

@end
@implementation FiltrateSlideView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.limitPadding = Default_LeftPadding;
        [self addSubview:self.shadowBGView];
        [self.shadowBGView addSubview:self.contentView];
        [self.contentView addGestureRecognizer:self.panGesture];
        
        //shadow添加手势
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideSlideBar:)];
        tapGesture.delegate = self;
        [self.shadowBGView addGestureRecognizer:tapGesture];
    }
    return self;
}
#pragma mark - Public Method
- (void)showView
{
    self.hidden = NO;
    [UIView animateWithDuration:Duration animations:^{
        [self setContentViewFrameWithOrginX:self.limitPadding];
        self.shadowBGView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:Deafult_Alpha];
    }];
}

- (void)hideView
{
    [UIView animateWithDuration:Duration animations:^{
        [self setContentViewFrameWithOrginX:Screen_Width];
        self.shadowBGView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0];
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}
#pragma mark - Private Method
- (void)setContentViewFrameWithOrginX:(CGFloat)orginX
{
    CGRect rect = self.contentView.frame;
    rect.origin.x = orginX;
    [self.contentView setFrame:rect];
}
- (void)updateFrameWithFastSpeed:(CGFloat)speedX
{
    //向左滑动
    BOOL towardRight = speedX > 0;
    //向右滑动
//    BOOL towardLeft = speedX < 0;
//    CGRect rect = self.contentView.frame;
    if (towardRight) {
        [self hideView];
    }
}
#pragma mark - Getter Method
- (UIView *)shadowBGView
{
    if (!_shadowBGView) {
        _shadowBGView = [[UIView alloc]initWithFrame:self.bounds];
        _shadowBGView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0];
    }
    return _shadowBGView;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(screen_width, 0, self.width-self.limitPadding, self.height)];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
- (UIPanGestureRecognizer *)panGesture
{
    if (!_panGesture) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panSlide:)];
        _panGesture.delegate = self;
    }
    return _panGesture;
}
#pragma mark - Set Method
- (void)setLimitPadding:(float)limitPadding
{
    _limitPadding = limitPadding;
    self.contentView.frame = CGRectMake(screen_width, 0, self.width-self.limitPadding, self.height);
}
#pragma mark - UITouch Event Method

- (void)panSlide:(UIPanGestureRecognizer*)panGesture
{
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            self.orginPoint = self.contentView.center;
            break;
        case UIGestureRecognizerStateChanged:
            [self panProgress:panGesture];
            break;
        case UIGestureRecognizerStateEnded:
            [self panStop:panGesture];
            break;
            
        default:
            break;
    }
}

#pragma mark - Pan Mathod
- (void)hideSlideBar:(UITapGestureRecognizer *)tap
{
    [self hideView];
}
- (void)panProgress:(UIPanGestureRecognizer*)pan
{
    CGPoint movePoint = [pan translationInView:self.contentView];
    self.contentView.center = CGPointMake(self.orginPoint.x+movePoint.x, self.orginPoint.y);
    
    CGRect rect = self.contentView.frame;
    //限制到边界距离
    if (rect.origin.x<=self.limitPadding) {
        rect.origin.x = self.limitPadding;
        self.contentView.frame = rect;
    }
    //滑出屏幕时停止
    if (rect.origin.x>=Screen_Width) {
        rect.origin.x = Screen_Width;
        self.contentView.frame = rect;
    }
    //背景色的渐变控制
    CGFloat distance = rect.origin.x - self.limitPadding;
    CGFloat alphaMaxDistance = Screen_Width*Distance_Scale;
    BOOL inShadowScope = ABS(distance) <= alphaMaxDistance;
    
    CGFloat speedX = [pan velocityInView:pan.view].x;
    if (inShadowScope) {
        BOOL towardRight = speedX > 0;
        CGFloat alpha = towardRight ? Deafult_Alpha *(1- (ABS(distance)/ alphaMaxDistance)) : ((alphaMaxDistance-ABS(distance))/ alphaMaxDistance)* Deafult_Alpha;
        self.shadowBGView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:alpha];
    }
    //向右滑
    /*
            CGFloat weekScale = Deafult_Alpha * (ABS(distance)/ alphaMaxDistance);
            CGFloat strongScale = Deafult_Alpha *(1- (ABS(distance)/ alphaMaxDistance));
            CGFloat alpha = towardRight ? weekScale : weekScale;
            NSLog(@"alpha:%f strongScale：%f weekScale：%f speedX:%f",alpha,strongScale,weekScale,speedX);
            NSLog(@"distance:%f alphaMaxDistance：%f towardRight：%d f",distance,alphaMaxDistance,towardRight);
     */
}
- (void)panStop:(UIPanGestureRecognizer*)pan
{
    //快速滑动
    CGFloat speedX = [pan velocityInView:pan.view].x;
    if (ABS(speedX) > Min_Pan_Speed) {
        [self updateFrameWithFastSpeed:speedX];
        return;
    }
    
    //慢速滑动
    CGRect rect = self.contentView.frame;
    CGFloat boundaryX = (Screen_Width+self.limitPadding)/(float)2;
    if (rect.origin.x<boundaryX) {
        [self showView];
    }else{
        [self hideView];
    }
}
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] && [touch.view isDescendantOfView:self.contentView]) {
        return NO;
    }

   return YES;
}
@end
