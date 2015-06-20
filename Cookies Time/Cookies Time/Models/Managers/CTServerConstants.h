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
#define kImagePath @"image"

#define kUser @"user"
#define kPassword @"password"

// Team
#define kTeamIdentifier @"teamId"
#define kInfo @"info"
#define kTag @"tag"

#define kSessionId "sessionId"


//Api Pathes

#define kApiPathLogin @"login"
#define kApiPathTeams @"team"
#define kCreateTeam @"create_team"

#endif /* CTServerConstants_h */
