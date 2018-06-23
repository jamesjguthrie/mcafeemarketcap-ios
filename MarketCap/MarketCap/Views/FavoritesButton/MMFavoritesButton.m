#import "MMFavoritesButton.h"
#import "MMFavoritesIconView.h"
#import "MMFavoritesCircleView.h"
#import "MMFavoritesActionView.h"

@implementation DotColors

+ (instancetype)dotColorsWithFirst:(UIColor *)firstColor second:(UIColor *)secondColor
{
    DotColors *dotColor = [[DotColors alloc] init];
    dotColor->first = firstColor;
    dotColor->second = secondColor;
    return dotColor;
}

@end

static const CGFloat mDuration = 1.0;
static const CGFloat mExpandDuration = 0.1298;
static const CGFloat mCollapseDuration = 0.1089;
static const CGFloat iconShowDelay = mExpandDuration + mCollapseDuration / 2;

struct DotRadiusFactors
{
    CGFloat first;
    CGFloat second;
};

static const struct DotRadiusFactors dotRadiusFactors = {
    .first = 0.0633,
    .second = 0.04
};

@implementation MMFavoritesButton

- (instancetype)initWithFrame:(CGRect)frame faveIconNormal:(UIImage *)image
{
    self = [super initWithFrame: frame];
    if(self)
    {
        _iconImage = image;
        _sparkGroupCount = 7;
        [self setupSubviews];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame: frame faveIconNormal: nil];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder: aDecoder];
    if(self)
    {
        [self setupSubviews];
        _sparkGroupCount = 7;
    }
    
    return self;
}

- (void)setupSubviews
{
    if(_iconImage == nil)
    {
        _iconImage = [self imageForState: UIControlStateNormal];
    }
    
    NSAssert(_iconImage != nil, @"No image found for UIControlStateNormal");
    
    [self setImage: [UIImage new] forState: UIControlStateNormal];
    [self setImage: [UIImage new] forState: UIControlStateSelected];
    [self setTitle: nil forState: UIControlStateNormal];
    [self setTitle: nil forState: UIControlStateSelected];
    
    _faveIcon = [self createFavoritesIcon: _iconImage];
    
    [self addActions];
}

- (MMFavoritesIconView *)createFavoritesIcon:(UIImage *)image
{
    return [MMFavoritesIconView createFavoritesIconOnView: self
                                                     icon: image
                                                    color: self.normalColor];
}

- (NSArray *)createFlaresWithRadius:(CGFloat)radius
{
    NSMutableArray *viewArray = [NSMutableArray new];
    NSInteger steps = 360 / self.sparkGroupCount;
    CGFloat base = self.bounds.size.width;
    
    DotRadius *dotRadius = [DotRadius new];
    dotRadius->first = base * dotRadiusFactors.first;
    dotRadius->second = base * dotRadiusFactors.second;
    CGFloat offset = 10.0;
    
    for(NSInteger index = 0; index < self.sparkGroupCount; index++)
    {
        CGFloat theta = steps * index + offset;
        DotColors *color = [self dotColorsAtIndex: index];
        MMFavoritesActionView *flare = [MMFavoritesActionView createFavoriteButtonFlare: self
                                                                     radius: radius
                                                                 firstColor: color->first
                                                                secondColor: color->second
                                                                      angle: theta
                                                                  dotRadius: dotRadius];
        [viewArray addObject: flare];
    }
    
    return [viewArray copy];
}

- (void)setSelected:(BOOL)selected
{
    [self animatedSelect: selected duration: mDuration];
    [super setSelected: selected];
}

- (void)animatedSelect:(BOOL)isSelected duration:(CGFloat)duration
{
    UIColor *color = isSelected ? self.selectedColor : self.normalColor;
    
    [_faveIcon animationSelect: isSelected
                     fillColor: color
                      duration: duration
                         delay: iconShowDelay];
    
    if(isSelected)
    {
        CGFloat radius = self.bounds.size.width * 1.3 / 2;
        CGFloat igniteFromRadius = radius * 0.8;
        CGFloat igniteToRadius = radius * 1.1;
        
        MMFavoritesCircleView *circle = [MMFavoritesCircleView createCircleWithButton: self
                                                                               radius: 0.01
                                                                            lineWidth: 3
                                                                            fillColor: self.circleFromColor];
        
        NSArray *flares = [self createFlaresWithRadius: igniteFromRadius];
        
        [circle animateToRadius: radius
                        toColor: self.circleToColor
                       duration: mExpandDuration
                          delay: 0];
        
        [circle animateCollapseWithRadius: radius
                                 duration: mCollapseDuration
                                    delay: 0.4];
        
        for(MMFavoritesActionView *flare in flares)
        {
            [flare animateIgniteShowWithRadius: igniteToRadius
                                      duration: 0.4
                                         delay: mCollapseDuration / 3.0];
            
            [flare animateIgniteHideWithDuration: 0.7 delay: 0.2];
        }
    }
}

- (DotColors *)dotColorsAtIndex:(NSInteger)index
{
    if(self.delegate && [self.delegate respondsToSelector: @selector(dotColors:)])
    {
        NSArray *colors = [self.delegate dotColors: self];
        
        NSInteger colorIndex = 0;
        for(NSInteger i = 0; i < colors.count; i++)
        {
            if(i == index)
            {
                colorIndex = i;
            }
            else
            {
                colorIndex = index % colors.count;
            }
        }
        
        return colors[colorIndex];
    }
    
    DotColors *dotColor = [[DotColors alloc] init];
    dotColor->first = self.dotFirstColor;
    dotColor->second = self.dotSecondColor;
    return dotColor;
}

- (void)addActions
{
    [self addTarget: self
             action: @selector(toggle:)
   forControlEvents: UIControlEventTouchUpInside];
}

- (void)toggle:(UIButton *)button
{
    button.selected = !button.isSelected;
    
    CGFloat delay = DISPATCH_TIME_NOW + mDuration * NSEC_PER_SEC;
    dispatch_after(delay, dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector: @selector(faveButton:didSelect:)])
        {
            [self.delegate faveButton: self didSelect: self.isSelected];
        }
    });
}

- (UIColor *)normalColor
{
    if(_normalColor == nil)
    {
        _normalColor = [UIColor colorWithRed: 255.0 / 255.0
                                       green: 255.0 / 255.0
                                        blue: 255.0 / 255.0
                                       alpha: 1];
    }
    
    return _normalColor;
}

- (UIColor *)selectedColor
{
    if (_selectedColor == nil)
    {
        _selectedColor = [UIColor orangeColor];
    }
    
    return _selectedColor;
}

- (UIColor *)dotFirstColor
{
    if (_dotFirstColor == nil)
    {
        _dotFirstColor = [UIColor orangeColor];
    }
    
    return _dotFirstColor;
}

- (UIColor *)dotSecondColor
{
    if (_dotSecondColor == nil)
    {
        _dotSecondColor = [UIColor orangeColor];
    }
    
    return _dotSecondColor;
}
- (UIColor *)circleFromColor
{
    if (_circleFromColor == nil)
    {
        _circleToColor = [UIColor clearColor];
    }
    
    return _circleFromColor;
}

- (UIColor *)circleToColor
{
    if (_circleToColor == nil)
    {
        _circleToColor = [UIColor orangeColor];
    }
    
    return _circleToColor;
}

@end
