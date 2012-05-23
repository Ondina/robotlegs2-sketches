package yourdomain.shell.views.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import yourdomain.common.controllers.events.ApplicationInfoEvent;
	import yourdomain.common.controllers.events.SomePopUpEvent;
	import yourdomain.modules.popupStuff.controllers.events.SomeEvent;
	import yourdomain.shell.views.components.PopupsMasterView;
	
	/**
	 *
	 * @author Ondina D. F.
	 */	
	public class PopupsMasterMediator extends Mediator
	{
		[Inject]
		public var view:PopupsMasterView;
		
		public function PopupsMasterMediator()
		{
		}
		override public function initialize():void
		{
			trace("==PopupsMasterMediator initialize");
			addViewListener(SomePopUpEvent.OPEN_POPUP, dispatch, SomePopUpEvent);
			addContextListener(SomePopUpEvent.POPUP_CLOSED, onPopupClosed, SomePopUpEvent);
			addContextListener(ApplicationInfoEvent.NAVIGATE_FROM, onLoosingFocus, ApplicationInfoEvent);
			
			addContextListener(SomeEvent.DATA_PING, onDataPing, SomeEvent);
			addViewListener(SomeEvent.DATA_PONG, dispatch, SomeEvent);
			view.initView();
		}
		
		private function onPopupClosed(event:SomePopUpEvent):void
		{
			view.onPopupClosed(event.popUpData);
		}
		
		private function onLoosingFocus(event:ApplicationInfoEvent):void
		{
			if(event.message==view.name)
			{
				view.resetInputs();
				dispatch(new SomePopUpEvent(SomePopUpEvent.CLOSE_POPUP, view, view.openedPopups));
			}
		}
		
		private function onDataPing(event:SomeEvent):void
		{
			view.onDataPing(event.someData);
		}
		
		override public function destroy():void
		{
			eventMap.unmapListeners();
			super.destroy();
			trace("PopupsMasterMediator.destroy()");
		}
	}
}