public class new_Album_Controller {

public Album__C album{get;set;}

public new_Album_Controller(){

    album = new Album__C();

}

public pageReference Save(){

    insert album;
    pageReference pgref = New pageReference('/apex/ThankkYou');
    pgref.setRedirect(true);
    return pgRef;

}

}