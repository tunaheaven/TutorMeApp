//
//  LoginViewController.h
//  TutorMeApp
//
//  Created by FF on 3/24/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginConnection.h"


@interface LoginViewController : UIViewController <ProcessAfterLogin>


@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

// dismiss the keyboard when return button is hit
- (IBAction) textFieldFinishedWithKeyBoard:(id)sender;

//dismiss the keyboard when space is tapped
-(IBAction) backgroundTouched:(id)sender;

// action performed when signin button is click
- (IBAction) loginButtonClicked:(id)sender;

// delegation method, refer to the method in Connection class
// @param login : Yes = success, No = fail
- (void) isLogInSuccessful : (BOOL)login;
@end


