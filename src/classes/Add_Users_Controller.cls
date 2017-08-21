public class Add_Users_Controller {
    Public blob picture {set;get;}
    public Users__c user{get;set;}
    public User_Profile__c profile {get;set;}
    public Add_Users_Controller(){
      user= new Users__c();
        profile= new User_Profile__c();
    }
    public pageReference save(){
       insert user;
       profile.User__c=user.Id;
        upsert profile;
        if (picture != null) {
            Attachment attachment = new Attachment();
            attachment.body = picture;
            attachment.name = 'User_Profile_' + profile.id + '.jpg';
            attachment.parentid = profile.id;
            attachment.ContentType = 'application/jpg';
            insert attachment;
            profile.Picture_Path__c = '/servlet/servlet.FileDownload?file='+ attachment.id;
            update profile;
    }
        pageReference pgref = New pageReference('/apex/musicHome');
    	pgref.setRedirect(true);
    	return pgRef;
    }
}