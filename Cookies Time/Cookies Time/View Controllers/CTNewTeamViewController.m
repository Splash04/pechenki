//
//  CTNewTeamViewController.m
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTNewTeamViewController.h"
#import "ActionSheetStringPicker.h"
#import "Constants.h"


@interface CTNewTeamViewController ()

@property (strong, nonatomic) NSMutableArray *restaurants;
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *hashtag;
@property (strong, nonatomic) IBOutlet UITextView *desc;
@property (strong, nonatomic) IBOutlet UIPickerView *restaurantPicker;
@property (strong, nonatomic) IBOutlet UITextField *restaurant;
@property (weak, nonatomic) IBOutlet UIImageView *groupImageView;

@end

@implementation CTNewTeamViewController

+ (NSString *)segueIdentifier
{
    static NSString *cellIdentifier = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        cellIdentifier = NSStringFromClass([self class]);
    });
    return cellIdentifier;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.restaurants = [[NSMutableArray alloc] initWithObjects:RESTAURANT_LIDO, nil];
    
    self.desc.layer.cornerRadius = 5.0f;
    self.desc.layer.masksToBounds = NO;
    self.desc.layer.borderWidth = .5f;
    self.desc.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)photoTap:(id)sender {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    
    pickerController.delegate = self;
    
    pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:pickerController animated:YES completion:nil];
    
}

- (IBAction)galleryTap:(id)sender {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    
    pickerController.delegate = self;
    
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    UIImage *originalImage = nil, *editedImage = nil, *imageToUse = nil;
//    
//    editedImage = (UIImage *) [info objectForKey:UIImagePickerControllerEditedImage];
//    originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
//    
//    if (editedImage) {
//        imageToUse = editedImage;
//    } else {
//        imageToUse = originalImage;
//    }
//    
//    // Save original photo
//    NSDate *dateToday = [NSDate date];
//    NSDateFormatter *format = [[NSDateFormatter alloc] init];
//    [format setDateFormat:@"yyyyMMdd_HHmmss"];
//    NSString *uniqueName = [format stringFromDate:dateToday];
//    [format release];
//    
//    NSString *photoName = [PMFileTools saveImage:imageToUse withUniqueName:uniqueName];
//    
//    // Resize and save mini photo
//    NSString *miniPhotoName = [PMFileTools saveMiniImage:imageToUse withUniqueName:uniqueName];
//    
//    [picker dismissViewControllerAnimated:YES completion:nil];
//    
//    PMCDPhotoLink *photoLink = (PMCDPhotoLink *)[[[NSManagedObject alloc] initWithEntity:[PMCDManager getEntityDescForPhotoLink] insertIntoManagedObjectContext:nil] autorelease];
//    photoLink.pathPhoto = photoName;
//    photoLink.pathMiniPhoto = miniPhotoName;
//    
//    [self.imagesViewController addImageToArray:photoLink toEndList:YES];
    
}

- (void)showRestaurantPicker
{
    [ActionSheetStringPicker showPickerWithTitle:PICKER_TITLE rows:self.restaurants initialSelection:0 doneBlock:
     ^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
         self.restaurant.text = self.restaurants[selectedIndex];
     } cancelBlock:^(ActionSheetStringPicker *picker) {
         
     } origin:self.view];
}

- (IBAction)restaurantChoice:(id)sender {
    [self showRestaurantPicker];
}

- (IBAction)saveTap:(id)sender {
#warning save team
}

@end
