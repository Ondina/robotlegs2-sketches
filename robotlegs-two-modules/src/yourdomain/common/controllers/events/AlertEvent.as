package yourdomain.common.controllers.events
{
	import flash.events.Event;

	public class AlertEvent extends Event
	{
		public static const INFO_ALERT:String="infoAlerts";
		public static const ERROR_ALERT:String="errorAlerts";
		public static const CLOSE_ALERT:String="closeAlerts";

		private var _message:String;

		public function AlertEvent(type:String, message:String=null, bubbles:Boolean=false, cancelable:Boolean=false)
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
			return new AlertEvent(type, message, bubbles, cancelable);
		}
	}
}
