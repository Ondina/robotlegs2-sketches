package yourdomain.modules.loginModule.controllers.events
{
	import flash.events.Event;

	import yourdomain.modules.loginModule.models.LoginVO;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class LoginEvent extends Event
	{
		//public static const LOG_IN_REMOTELY:String="logInRemotely";
		public static const LOG_IN_LOCALLY:String="logInLocally";
		public static const CONFIGURE_LOCAL_SERVICES:String="configureLocalServices";

		public function LoginEvent(type:String, loginData:LoginVO=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_loginData=loginData;
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new LoginEvent(type, loginData, bubbles, cancelable);
		}

		protected var _loginData:LoginVO;

		public function get loginData():LoginVO
		{
			return _loginData;
		}
	}
}
