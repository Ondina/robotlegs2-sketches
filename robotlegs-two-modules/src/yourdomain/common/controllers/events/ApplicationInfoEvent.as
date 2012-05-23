package yourdomain.common.controllers.events
{
	import flash.events.Event;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class ApplicationInfoEvent extends Event
	{
		//EXIT APP not used yet
		public static const EXIT_APPLICATION:String="exitApplication";
		public static const CLOSING_APPLICATION:String="closingApplication";		
		//LOG IN
		//public static const USER_LOGGED_IN_REMOTELY:String="userLoggedInRemote";
		public static const USER_LOGGED_IN_LOCALLY:String="userLoggedInLocally";
		//public static const REMOTE_SERVER_DOWN:String="remoteServerDown";
		//LOGOUT
		public static const LOGGED_OUT:String="LOGGED_OUT";
		//NAVIGATE not used yet:
		//public static const NAVIGATE_TO:String="navigateTo";
		public static const NAVIGATE_FROM:String="navigateFrom";

		private var _message:String;

		public function ApplicationInfoEvent(type:String, message:String=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_message=message;
		}

		public function get message():String
		{
			return _message;
		}

		override public function clone():Event
		{
			return new ApplicationInfoEvent(type, message, bubbles, cancelable);
		}
	}
}
