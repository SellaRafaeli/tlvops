// fb login
window.fbAsyncInit = function() {
  FB.init({
    appId            : <%= $prod ? '183661335520562' : '1978656169073756' %>,
    autoLogAppEvents : true,
    xfbml            : true,
    version          : 'v2.10'
  });
  FB.AppEvents.logPageView();
};

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "https://connect.facebook.net/en_US/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));

window.fbLogin = function(){
  if (!window.FB) return alert('Please try again in 5 seconds.')
  FB.login(function(response) {
    if (response.status === 'connected') {
      document.location= `/fb_login?token=${response.authResponse.accessToken}`;
    } else {
      console.log('fbLogin fail ',response)
    }
  });
}
// end FB Login

$( document ).ready(function() {
	console.log('done on-document-ready')
}); 