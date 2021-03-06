//
//  TabBarPresenter.m
//  EatTrainSleepRepeat
//
//  Created pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//  Template generated by Balashov Artem @pockerhead
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TabBarPresenter.h"
#import "TabBarProtocols.h"
#import "KeychainService.h"

@interface TabBarPresenter () <TabBarPresenterInterface>
@property (strong, nonatomic) NSObject<TabBarWireframeInterface>* router;
@end

@implementation TabBarPresenter

- (instancetype)initWithView:(NSObject<TabBarView>*)view router:(NSObject<TabBarWireframeInterface>*)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.router = router;
    }
    return self;
}

- (void)viewDidAppear {
    
}

- (void)viewDidDissappear {
    //Default implementation
}

- (void)viewDidLoad {
    //Default implementation
}

- (void)viewWillAppear {
    BOOL auth = ([KeychainService loadObjectForKey:authTokenKey] && [KeychainService loadObjectForKey:userIDKey]);
    [self.view configureInitialVCs:auth];
}

- (void)viewWillDissappear {
    //Default implementation
}

@end
