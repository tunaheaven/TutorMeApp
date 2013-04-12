//
//  RegisterViewController.h
//  Login
//  This class is to represent the Register Scene on the storyboard
//  and controller for the STATIC table view
//  Created by Lam Lu on 2/19/13.
//  Copyright (c) 2013 Lam Lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterConnection.h"

@interface RegisterViewController : UITableViewController<ProcessAfterRegister>
{
    RegisterConnection * connection;
}

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPassTextField;


// action listener for register button
- (IBAction)registerButtonClicked:(id)sender;

// dismiss the keyboard when return button is hit
- (IBAction) textFieldFinishedWithKeyBoard:(id)sender;

// delegation method, refer to the method in RegisterConnection class
// @param isPass : Yes = success, No = fail
- (void) isRegisterSuccessful : (BOOL) isPass;
@end
