//
//  RegisterViewController.m
//  TutorMeApp
//
//  Created by FF on 3/24/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 * Action listener for registerButton
 */

- (IBAction)registerButtonClicked:(id)sender
{
    NSString * username = self.usernameTextField.text;
    NSString * password = self.passwordTextField.text;
    NSString * reEnterPassword = self.reEnterPassTextField.text;
    
    
    // create connection and process
    connection = [[RegisterConnection alloc] init];
    
    //always check if user enter username and password.
    if(username.length == 0 || password.length == 0 || reEnterPassword.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty Input"
                                                        message:@"Enter username or password"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil; //release arlet when done
    }
    
    else
    {
        if (![password isEqualToString:reEnterPassword])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Passwords Do Not Match"
                                                            message:@"Re-enter your passwords"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            alert = nil; //release arlet when done
        }
        
        else
        {
            [connection setDelegate:self];
            [connection createConnection:username :password];
        }
        
    }
    username = nil;
    password = nil;
    username = nil;
    password = nil;
}

/*
 * Dissmis the keyboard when the return button is pressed
 * Connect this function to Did End on Exit of the text field from
 * storyboard
 * @param sender, the textfield responder
 */
- (IBAction) textFieldFinishedWithKeyBoard:(id)sender {
    [sender resignFirstResponder];
}

/*Dismiss the keyboard when space is tapped
 *storyboard config:
 *loginViewController.Control touch down properties drag and connect to loginViewController(yellow box)
 *Then choose backgroundTounced method to connect
 */
-(IBAction)backgroundTouched:(id)sender
{
    [self.view endEditing:(YES)];
    
}

// delegation method, refer to the method in RegisterConnection class
// @param isPass : Yes = success, No = fail
- (void) isRegisterSuccessful : (BOOL) isPass;
{
    if(isPass == YES)
        [self performSegueWithIdentifier: @"RegisterSuccess" sender:self];
    else if (isPass == NO)
    {
        NSLog(@"%@", connection.registerError);
        //[self performSegueWithIdentifier:@"LoginFail" sender:self];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Register Failed"
                                                        message:connection.registerError
                                                       delegate:nil
                                              cancelButtonTitle:@"Try Again" otherButtonTitles: nil];
        [alert show];
        alert = nil; //release arlet when done
    }
    connection = nil;
}

@end
