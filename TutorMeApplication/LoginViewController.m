//
//  LoginViewController.m
//  TutorMeApp
//
//  Created by FF on 3/24/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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



- (IBAction) loginButtonClicked:(id)sender
{
    
    // create connection and process
    LoginConnection * connection = [[LoginConnection alloc] init];
    
    NSString * username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    
    //always check if user enter username and password.
    if(username.length == 0 || password.length == 0 )
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
        [connection setDelegate:self];
        [connection createConnection:username :password];
        
    }
    connection= nil;
    username = nil;
    password = nil;
    
    
}

// delegation method, refer to the method in Connection class
// @param login : Yes = success, No = fail
- (void) isLogInSuccessful : (BOOL)login;
{
    if(login == YES)
        [self performSegueWithIdentifier: @"LoginSuccess" sender:self];
    else if (login == NO)
    {
        //[self performSegueWithIdentifier:@"LoginFail" sender:self];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed"
                                                        message:@"Could not find your username or password on the server"
                                                       delegate:nil
                                              cancelButtonTitle:@"Try Again" otherButtonTitles: nil];
        [alert show];
        alert = nil; //release arlet when done
    }
}



@end


