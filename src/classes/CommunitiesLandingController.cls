/**
 * An apex page controller that takes the user to the right start page based on credentials or lack thereof
 */
public with sharing class CommunitiesLandingController {
// Code we will invoke on page load.
public PageReference forwardToStartPage() {
String communityUrl = 'http://itec-developer-edition.ap5.force.com/';
String customHomePage = '/apex/Home';
if (UserInfo.getUserType().equals('Guest')) {
return new PageReference(communityUrl + '/login?startURL=' +
EncodingUtil.urlEncode(customHomePage, 'UTF-8'));
}else {
return Network.communitiesLanding();
}
}
public CommunitiesLandingController() {}
}