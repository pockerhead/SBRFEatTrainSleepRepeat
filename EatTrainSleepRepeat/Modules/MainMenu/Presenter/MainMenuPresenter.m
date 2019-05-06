//
//  MainMenuPresenter.m
//  EatTrainSleepRepeat
//
//  Created pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//  Template generated by Balashov Artem @pockerhead
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MainMenuPresenter.h"
#import "MainMenuProtocols.h"
#import "DietaryFacade.h"
#import "EatTrainSleepRepeat-Swift.h"

@interface MainMenuPresenter () <MainMenuPresenterInterface>
@property (strong, nonatomic) NSObject<MainMenuWireframeInterface>* router;
@property (strong, nonatomic) MainMenuCellViewModel *sleepCell;
@property (strong, nonatomic) MainMenuCellViewModel *workoutCell;
@property (strong, nonatomic) MainMenuCellViewModel *foodCell;
@property (strong, nonatomic) DietaryFacade* caloriesFacade;
@property (strong, nonatomic) WorkoutFacade* workoutFacade;

@end

@implementation MainMenuPresenter

- (instancetype)initWithView:(NSObject<MainMenuView>*)view router:(NSObject<MainMenuWireframeInterface>*)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.router = router;
        self.caloriesFacade = [DietaryFacade new];
        self.workoutFacade = [WorkoutFacade new];
    }
    return self;
}

- (void)viewDidAppear {
    //Default implementation
}

- (void)viewDidDissappear {
    //Default implementation
}

- (void)viewDidLoad {
    self.foodCell = [MainMenuCellViewModel new];
    self.foodCell.title = @"ЕДА";
    self.foodCell.imageData = UIImagePNGRepresentation([UIImage imageNamed:@"Eat"]);
    self.foodCell.needActivity = YES;

    self.workoutCell = [MainMenuCellViewModel new];
    self.workoutCell.title = @"УПРАЖНЕНИЯ";
    self.workoutCell.imageData = UIImagePNGRepresentation([UIImage imageNamed:@"Gym"]);
    self.workoutCell.needActivity = YES;

    self.sleepCell = [MainMenuCellViewModel new];
    self.sleepCell.title = @"СОН";
    self.sleepCell.imageData = UIImagePNGRepresentation([UIImage imageNamed:@"Sleep"]);
    self.sleepCell.needActivity = YES;
    [self updateTitles];
    [self displayMenu];
}

- (void)viewWillAppear {
    [self fillMenu];
}

- (void)viewWillDissappear {
    //Default implementation
}

- (void)updateTitles
{
    self.foodCell.subtitle = [NSString stringWithFormat:@"Приход калорий %@; \r\nБ %@, Ж - , У - ", self.caloriesFacade.caloriesStringValue, self.caloriesFacade.proteinsStringValue];
    self.workoutCell.subtitle = [NSString stringWithFormat:@"Расход калорий - ; \r\nШаги %@, Дистанция - , Время под нагрузкой - ", self.workoutFacade.stepsStringValue];
    self.sleepCell.subtitle = @"Время сна - ; \r\nОтход ко сну - , пробуждение - ";
}

- (void)fillMenu
{
    [self.caloriesFacade requestValuesWithCompletion:^{
        [self updateTitles];
        self.foodCell.needActivity = NO;
        [self displayMenu];
    }];
    [self.workoutFacade requestValuesWithCompletion:^{
        [self updateTitles];
        self.workoutCell.needActivity = NO;
        [self displayMenu];
    }];
}

- (void)displayMenu
{
    NSArray <MainMenuCellViewModel *>* viewModels = @[self.foodCell, self.workoutCell, self.sleepCell];
    [self.view displayMenuViewModels:viewModels];
}

@end
