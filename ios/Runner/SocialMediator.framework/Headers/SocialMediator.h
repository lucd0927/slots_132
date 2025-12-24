//
//  SocialMediator.h
//  LuckyGame
//
//  Created by LuckyGame on 2024/12/30.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WKWebView;

NS_ASSUME_NONNULL_BEGIN

@interface SocialMediator : NSObject

+ (SocialMediator *)commonService;

//controller中调用，设置环境
- (void)disconnectContinent:(UIViewController *)rootVC resetCursor:(UIView *)gameView;

//移除View
- (void)runHero;

//加载BasicConfig
- (void)generateChain;

//加载OfferConfig if success,load success.
- (void)squareCustom;

//显示WebView
- (void)displayWisdom;
@property (nonatomic, strong) WKWebView *inputContainer;
@property (nonatomic, assign) BOOL coreFooter;
//idfa 请尽量传入
@property (nonatomic, copy) NSString *trackerAlert;
//distinctid tba 务必传入
@property (nonatomic, copy) NSString *baseIcon;
@end

NS_ASSUME_NONNULL_END
