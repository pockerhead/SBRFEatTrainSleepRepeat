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
#import "KeychainService.h"


@interface MainMenuPresenter () <MainMenuPresenterInterface>

@property (strong, nonatomic) NSObject<MainMenuWireframeInterface>* router;

@property (strong, nonatomic) MainMenuDataMediator *foodSection;
@property (strong, nonatomic) NSArray <MainMenuCellViewModel *> *foodRows;

@property (strong, nonatomic) MainMenuDataMediator *workoutSection;
@property (strong, nonatomic) NSArray <MainMenuCellViewModel *> *workoutRows;

@property (strong, nonatomic) MainMenuDataMediator *sleepSection;
@property (strong, nonatomic) NSArray <MainMenuCellViewModel *> *sleepRows;

@property (strong, nonatomic) NSArray <MainMenuDataMediator *> *menuDataSource;

@property (strong, nonatomic) DietaryFacade* dietaryFacade;
@property (strong, nonatomic) WorkoutFacade* workoutFacade;

@end

@implementation MainMenuPresenter

- (instancetype)initWithView:(NSObject<MainMenuView>*)view router:(NSObject<MainMenuWireframeInterface>*)router {
    self = [super init];
    if (self) {
        _view = view;
        _router = router;
        _dietaryFacade = [DietaryFacade new];
        _workoutFacade = [WorkoutFacade new];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewWillAppear) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
    return self;
}

// MARK: - View

- (void)viewDidAppear {
    //Default implementation
}

- (void)viewDidDissappear {
    //Default implementation
}

- (void)viewDidLoad {
    [self displayMenu];
}


- (void)viewWillAppear {
    [self fillMenu];
}

- (void)viewWillDissappear {
    //Default implementation
}

- (void)didSelectRowAt:(NSIndexPath *)indexPath
{
    NSString *token = [KeychainService loadObjectForKey:authTokenKey];
    if (token == nil) {
        [self.router navigateToAuth];
        return;
    }
    if (indexPath.section == [self.menuDataSource indexOfObject:self.foodSection])
    {
        [self.router navigateToMealTime];
    }
    else if (indexPath.section == [self.menuDataSource indexOfObject:self.workoutSection])
    {
        NSLog(@"WORKOUTSection");
    }
    
    
}

// MARK: - Private

- (void)fillMenu
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    __weak typeof(self) weakSelf = self;
    [self.dietaryFacade updateValuesWithCompletion:^{
        weakSelf.foodSection.sectionHeader.isExpanded = YES;
        weakSelf.foodSection.rows = [weakSelf configureFoodRows];
        dispatch_group_leave(group);
    }];
    dispatch_group_enter(group);
    [self.workoutFacade updateValuesWithCompletion:^{
        weakSelf.workoutSection.sectionHeader.isExpanded = YES;
        weakSelf.workoutSection.rows = [weakSelf configureWorkoutRows];
        dispatch_group_leave(group);
    }];
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [weakSelf displayMenu];
    });
}

- (void)displayMenu
{
    self.menuDataSource = @[self.foodSection, self.workoutSection];
    [self.view displayMenu:self.menuDataSource];
}

- (MainMenuDataMediator *)foodSection
{
    if (_foodSection == nil)
    {
        _foodSection = [MainMenuDataMediator new];
        _foodSection.sectionHeader = [MainMenuHeaderViewModel new];
        _foodSection.sectionHeader.name = @"Питание";
        _foodSection.sectionHeader.icon = UIImagePNGRepresentation([UIImage imageNamed:@"Eat"]);
        _foodSection.isExpanded = YES;
        _foodSection.sectionHeader.isExpanded = _foodSection.isExpanded;
        __weak typeof(self) weakSelf = self;
        _foodSection.sectionHeader.tapAction = ^{
            if (weakSelf.foodSection.isExpanded) {
                weakSelf.foodSection.rows = @[];
            } else {
                weakSelf.foodSection.rows = [weakSelf configureFoodRows];
            }
            weakSelf.foodSection.isExpanded = !weakSelf.foodSection.isExpanded;
            weakSelf.foodSection.sectionHeader.isExpanded = weakSelf.foodSection.isExpanded;
            [weakSelf.view displayMenu:weakSelf.menuDataSource];
        };
        _foodSection.rows = [self configureFoodRows];
    }
    return _foodSection;
}

- (NSArray <MainMenuCellViewModel *> * )configureFoodRows
{
    return @[[[MainMenuCellViewModel alloc] initWithTitle:@"Приход калорий" subtitle:[NSString stringWithFormat:@"%@", self.dietaryFacade.caloriesStringValue] needActivity:self.dietaryFacade.caloriesValue == nil color:[UIColor mainGreen]],
             [[MainMenuCellViewModel alloc] initWithTitle:@"Белки" subtitle:[NSString stringWithFormat:@"%@", self.dietaryFacade.proteinsStringValue] needActivity:self.dietaryFacade.proteinsValue == nil color:[UIColor mainGreen]],
             [[MainMenuCellViewModel alloc] initWithTitle:@"Жиры" subtitle:[NSString stringWithFormat:@"%@", self.dietaryFacade.fatsStringValue] needActivity:self.dietaryFacade.fatsValue == nil color:[UIColor mainGreen]],
             [[MainMenuCellViewModel alloc] initWithTitle:@"Углеводы" subtitle:[NSString stringWithFormat:@"%@", self.dietaryFacade.carbonhydratesStringValue] needActivity:self.dietaryFacade.carbonhydratesValue == nil color:[UIColor mainGreen]]];
}

- (MainMenuDataMediator *)workoutSection
{
    if (_workoutSection != nil)
    {
        return _workoutSection;
    }
    _workoutSection = [MainMenuDataMediator new];
    _workoutSection.sectionHeader = [MainMenuHeaderViewModel new];
    _workoutSection.sectionHeader.name = @"Активность";
    _workoutSection.isExpanded = YES;
    _workoutSection.sectionHeader.isExpanded = _workoutSection.isExpanded;
    _workoutSection.sectionHeader.icon = UIImagePNGRepresentation([UIImage imageNamed:@"Gym"]);
    __weak typeof(self) weakSelf = self;
    _workoutSection.sectionHeader.tapAction = ^{
        if (weakSelf.workoutSection.isExpanded) {
            weakSelf.workoutSection.rows = @[];
        } else {
            weakSelf.workoutSection.rows = [weakSelf configureWorkoutRows];
        }
        weakSelf.workoutSection.isExpanded = !weakSelf.workoutSection.isExpanded;
        weakSelf.workoutSection.sectionHeader.isExpanded = weakSelf.workoutSection.isExpanded;
        [weakSelf.view displayMenu:weakSelf.menuDataSource];
    };
    _workoutSection.rows = [self configureWorkoutRows];
    return _workoutSection;
}

- (NSArray <MainMenuCellViewModel *> *)configureWorkoutRows {
    return @[[[MainMenuCellViewModel alloc] initWithTitle:@"Расход калорий" subtitle:[NSString stringWithFormat:@"%@", self.workoutFacade.overallEnergyBurnedStringValue] needActivity:self.workoutFacade.overallEnergyBurnedValue == nil color:[UIColor mainOrange]],
             [[MainMenuCellViewModel alloc] initWithTitle:@"Шаги" subtitle:[NSString stringWithFormat:@"%@", self.workoutFacade.stepsStringValue] needActivity:self.workoutFacade.stepsValue == nil color:[UIColor mainOrange]],
             [[MainMenuCellViewModel alloc] initWithTitle:@"Дистанция ходьбы и бега" subtitle:[NSString stringWithFormat:@"%@", self.workoutFacade.distanceStringValue] needActivity:self.workoutFacade.distanceValue == nil color:[UIColor mainOrange]]
             ];
}


@end

