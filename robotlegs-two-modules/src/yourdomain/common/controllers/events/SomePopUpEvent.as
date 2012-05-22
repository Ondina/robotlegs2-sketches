package yourdomain.common.controllers.events
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;

	public class SomePopUpEvent extends Event
	{
		public static const OPEN_POPUP:String="openPopupContainer";
		public static const CLOSE_POPUP:String="closePopupContainer";
		public static const POPUP_CLOSED:String="popupContainerClosed";
		public static const POPUP_DATA_CHANGED:String="popupDataChanged";

		private var _popUpData:*;
		private var _popUpOwner:DisplayObjectContainer;
		private var _popUpChild:*;

		public function SomePopUpEvent(type:String, popUpOwner:DisplayObjectContainer=null, popUpData:*=null, popUpChild:*=null)
		{
			_popUpData=popUpData;
			_popUpOwner=popUpOwner;
			_popUpChild=popUpChild;
			super(type, false, false);
		}

		override public function clone():Event
		{
			return new SomePopUpEvent(type, popUpOwner, popUpData, popUpChild);
		}

		public function get popUpOwner():DisplayObjectContainer
		{
			return _popUpOwner;
		}

		public function get popUpData():*
		{
			return _popUpData;
		}

		public function get popUpChild():*
		{
			return _popUpChild;
		}
	}
}
