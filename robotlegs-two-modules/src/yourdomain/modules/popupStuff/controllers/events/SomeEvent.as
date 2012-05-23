package yourdomain.modules.popupStuff.controllers.events
{
	import flash.events.Event;
	
	import yourdomain.modules.popupStuff.models.SomeVO;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class SomeEvent extends Event
	{
		public static const DATA_PING:String="dataPing";
		public static const DATA_PONG:String="dataPong";

		public function SomeEvent(type:String, someData:SomeVO=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_someData=someData;
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new SomeEvent(type, someData, bubbles, cancelable);
		}

		protected var _someData:SomeVO;

		public function get someData():SomeVO
		{
			return _someData;
		}
	}
}
