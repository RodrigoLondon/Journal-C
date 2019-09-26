//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Lewis Jones on 01/02/2019.
//  Copyright © 2019 Rodrigo. All rights reserved.
//


#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateWithEntry: self.entry];
}


-(void)updateWithEntry:(Entry *)entry
{
    if (entry) {
        self.entry = entry;
        self.titleTextField.text = self.entry.title;
        self.bodyTextView.text = self.entry.bodyText;
        
    }
}

-(IBAction)saveButtonTapped:(id)sender {
    if (self.entry) {
        self.entry.title = self.titleTextField.text;
        self.entry.bodyText = self.bodyTextView.text;
        self.entry.timestamp = [NSDate date];
    } else {
        Entry *entry = [[Entry alloc] initWithTitle: self.titleTextField.text bodyText: self.bodyTextView.text timestamp:[NSDate date]];
        [[EntryController shared] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:true];
}

-(IBAction)clearButtonTapped:(id)sender {
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}

#pragma mark - UITextFieldDelegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}

@end
