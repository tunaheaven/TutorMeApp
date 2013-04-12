//
//  RegisterViewController.h
//  TutorMeApp
//
//  Created by FF on 3/24/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterConnection.h"


@interface RegisterViewController : UIViewController<ProcessAfterRegister>
{
    RegisterConnection * connection;
}

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPassTextField;


// action listener for register button
- (IBAction)registerButtonClicked:(id)sender;

//dimiss keyboard when backgroudn is tapped
-(IBAction)backgroundTouched:(id)sender;

// dismiss the keyboard when return button is hit
- (IBAction) textFieldFinishedWithKeyBoard:(id)sender;

// delegation method, refer to the method in RegisterConnection class
// @param isPass : Yes = success, No = fail
- (void) isRegisterSuccessful : (BOOL) isPass;
@end
