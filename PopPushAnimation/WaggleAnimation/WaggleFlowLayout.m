//
//  WaggleFlowLayout.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/16.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "WaggleFlowLayout.h"

@interface WaggleFlowLayout ()

@property (nonatomic,strong)UIDynamicAnimator *animator;
@property (nonatomic)CGFloat springDamping;
@property (nonatomic)CGFloat springFrequency;
@property (nonatomic)CGFloat resistanFactor;

@end

@implementation WaggleFlowLayout

- (instancetype)init {
    
    if (self = [super init]) {
        
        _springDamping = 0.5;//阻尼
        _springFrequency = 1;//震动频率
        _resistanFactor = 1000;//阻力
    }
    return self;
}

-(void)prepareLayout {
    [super prepareLayout];
    
    
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
        CGSize contentSize = [self collectionViewContentSize];
        NSArray *items = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
        
        for (UICollectionViewLayoutAttributes *item in items) {
            UIAttachmentBehavior *spring = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:item.center];
            
            spring.length = 0;
            spring.damping = self.springDamping;
            spring.frequency = self.springFrequency;
            
            [_animator addBehavior:spring];
        }
    }
//    [self resetCellAnimator];
    
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray * original   = [super layoutAttributesForElementsInRect:rect];
    NSArray * attributes = [[NSArray alloc] initWithArray:original copyItems:YES];
    	for (id obj in attributes) {
//    		NSLog(@"attributes **************** %@",obj);
    	}
    	for (id obj in [_animator itemsInRect:rect]) {
//    		NSLog(@"animator a ---------------- %@",obj);
    	}
    return [_animator itemsInRect:rect];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [_animator layoutAttributesForCellAtIndexPath:indexPath];
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    UIScrollView *scrollView = self.collectionView;
    CGFloat scrollDelta = newBounds.origin.y - scrollView.bounds.origin.y;
    CGPoint touchLocation = [scrollView.panGestureRecognizer locationInView:scrollView];
    
    for (UIAttachmentBehavior *spring in _animator.behaviors) {
        CGPoint anchorPoint = spring.anchorPoint;
        CGFloat distanceFromTouch = fabs(touchLocation.y - anchorPoint.y);
        CGFloat scrollResistance = distanceFromTouch / self.springFrequency;
        
        UICollectionViewLayoutAttributes *item = [spring.items firstObject];
        CGPoint center = item.center;
        center.y += (scrollDelta > 0) ? MIN(scrollDelta, scrollDelta * scrollResistance)
        : MAX(scrollDelta, scrollDelta * scrollResistance);
        item.center = center;
        
        [_animator updateItemUsingCurrentState:item];
    }
    //return YES;
    return NO;
}









- (void)resetCellAnimator{
    CGSize contentSize = [self collectionViewContentSize];
    NSArray *items = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
    
    self.animator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
    
    for (UICollectionViewLayoutAttributes *item in items) {
        UIAttachmentBehavior *spring = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:item.center];
        
        spring.length = 0;
        spring.damping = self.springDamping;
        spring.frequency = self.springFrequency;
        
        [self.animator addBehavior:spring];
    }
}


- (void)setSpringDamping:(CGFloat)springDamping
{
	if (springDamping >= 0 && _springDamping != springDamping) {
		_springDamping = springDamping;
		for (UIAttachmentBehavior *spring in self.animator.behaviors) {
			spring.damping = _springDamping;
		}
	}
}

- (void)setSpringFrequency:(CGFloat)springFrequency
{
	if (springFrequency >= 0 && _springFrequency != springFrequency) {
		_springFrequency = springFrequency;
		for (UIAttachmentBehavior *spring in self.animator.behaviors) {
			spring.frequency = _springFrequency;
		}
	}
}


@end
