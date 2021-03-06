//
//  ProfilePresenter.h
//  EatTrainSleepRepeat
//
//  Created pockerhead on 18/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//  Template generated by Balashov Artem @pockerhead
//

#import "ProfileProtocols.h"

@interface ProfilePresenter: NSObject<ProfilePresenterInterface>
@property (nonatomic, weak) NSObject<ProfileView> *view;
- (instancetype)initWithView:(NSObject<ProfileView>*)view
                      router:(NSObject<ProfileWireframeInterface>*)router;
@end


