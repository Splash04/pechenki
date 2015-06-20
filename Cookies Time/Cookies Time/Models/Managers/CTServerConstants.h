//
//  CTServerConstants.h
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#ifndef CTServerConstants_h
#define CTServerConstants_h

#define kServerAddress @"http://10.55.1.27:8888/api"

//Basic keys
#define kErrorCode @"errorCode"
#define kErrorMessage @"errorMessage"
#define kDataType @"dataType"

// User
#define kUserId @"userId"
#define kName @"name"
#define kEmail @"email"
#define kPhoneNumber @"phone"
#define kImagePath @"imageUrl"

// Order
#define kOrederId @"orderId"
#define kPrice @"price"
#define kOrderTeam @"team"

#define kUser @"userName"
#define kPassword @"password"

// Team
#define kTeam @"team"
#define kTeamIdentifier @"teamId"
#define kInfo @"info"
#define kTag @"tag"

// Product ID

#define kSessionId @"sessionId"
#define kProductWeight @"productWeight"
#define kCategory @"category"
#define kCategoryId @"categoryId"

// User Order
#define kProducts @"products"

// Restaurant
#define kRestaurantId @"restaurantId"
#define kRestaurantAddress @"restaurantAddress"

//Api Pathes

#define kApiPathLogin @"login"
#define kApiPathTeams @"team"
#define kApiCreateTeam @"create_team"
#define kApiUpdateUserOrder @"user_order"
#define kGetCategories @"category\\getbyrestaurant"
#define kGetProducts @"product\\getbycategory"

#endif /* CTServerConstants_h */
