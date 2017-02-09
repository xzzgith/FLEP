//
//  UIScrollView+EmptyDataSet.h
//  FLEmptyDataSet
//
//  Created by Felix on 2017/1/22.
//  Copyright © 2017年 FREEDOM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FLEmptyPageDataSource;
@protocol FLEmptyPageDelegate;

@interface UIScrollView (EmptyPage)
/**
 *  The object that acts as the delegate of the empty page.
 */
@property (nonatomic, weak, nullable) id <FLEmptyPageDelegate>ep_Delegate;
/**
 *  The object that acts as the data source of the empty page.
 */
@property (nonatomic, weak, nullable) id <FLEmptyPageDataSource>ep_DataSource;
/**
 *  YES if the empty page is visible.
 */
//@property (nonatomic, assign) BOOL ep_Visible;


@end

@protocol FLEmptyPageDelegate <NSObject>
@optional
/**
 *  The empty view will appear.
 */
- (void)emptyPageWillAppear:(UIScrollView *)scrollView;
/**
 *  The empty view did appear.
 */
- (void)emptyPageDidAppear:(UIScrollView *)scrollView;
/**
 *  The empty view will disappear.
 */
- (void)emptyPageWillDisappear:(UIScrollView *)scrollView;
/**
 *  The empty view did disappear.
 */
- (void)emptyPageDidDisappear:(UIScrollView *)scrollView;
@end

@protocol FLEmptyPageDataSource <NSObject>
@optional
/**
 *
 */
- (nullable UIView *)customViewForEmptyPage:(UIScrollView *)scrollView;
/**
 *
 */
- (nullable NSAttributedString *)titleForEmptyPage:(UIScrollView *)scrollView;
/**
 *
 */
- (nullable NSAttributedString *)descriptionForEmptyPage:(UIScrollView *)scrollView;
/**
 *
 */
- (nullable UIImage *)imageForEmptyPage:(UIScrollView *)scrollView;
/**
 *
 */
- (nullable NSAttributedString *)buttonTitleForEmptyPage:(UIScrollView *)scrollView forState:(UIControlState)state;
/**
 *
 */
- (nullable UIImage *)buttonBackgroundImageForEmptyPage:(UIScrollView *)scrollView forState:(UIControlState)state;
/**
 *
 */
- (CGFloat)verticalOffsetForEmptyPage:(UIScrollView *)scrollView;
/**
 *
 */
- (UIColor *)backgroundColorForEmptyPage:(UIScrollView *)scrollView;
/**
 *  The default value is YES.
 */
- (BOOL)emptyPageShouldAllowTouch:(UIScrollView *)scrollView;
/**
 *  The default value is NO.
 */
- (BOOL)emptyPageShouldAllowScroll:(UIScrollView *)scrollView;
/**
 *
 */
- (BOOL)emptyPageShouldAllowAnimation:(UIScrollView *)scrollView;
/**
 *  animation For EmptyPage.
 */
- (CAAnimation *)animationForEmptyPage:(UIScrollView *)scrollView;
@end
NS_ASSUME_NONNULL_END

