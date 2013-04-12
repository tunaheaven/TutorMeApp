//
//  CustomTable.m
//  TableView
//
//  Created by iPhone SDK Articles on 1/17/09.
//  Copyright www.iPhoneSDKArticles.com 2009.
//

#import "CustomTable.h"
#import "TutorMeAppDelegate.h"

@implementation CustomTable

- (void)viewDidLoad {
    [super viewDidLoad];
	
	//Initialize the array.
	listOfItems = [[NSMutableArray alloc] init];
	
	//Add items
	[listOfItems addObject:@"Philosophy"];
	[listOfItems addObject:@"English"];
	[listOfItems addObject:@"Physics"];
	[listOfItems addObject:@"Chemistry"];
	[listOfItems addObject:@"Computer Science"];
	[listOfItems addObject:@"Nursing"];
	[listOfItems addObject:@"Nutrition"];
	[listOfItems addObject:@"Health"];
	
	//Set the title
	self.navigationItem.title = @"Major ";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listOfItems count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set up the cell...
	NSString *cellValue = [listOfItems objectAtIndex:indexPath.row];
    
    UILabel *label=(UILabel*)[cell  viewWithTag:1];
    label.text=[listOfItems objectAtIndex:indexPath.row];
    label.adjustsLetterSpacingToFitWidth = YES;
	cellValue =  nil;
    label = nil;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    }






@end
