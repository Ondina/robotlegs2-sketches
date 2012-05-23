package yourdomain.common.views.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;
	
	import yourdomain.common.controllers.events.SomePopUpEvent;
	import yourdomain.common.views.components.SomePopUpView;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class SomePopUpMediator extends Mediator
	{
		[Inject]
		public var view:SomePopUpView;

		[Inject]
		public var viewManager:IViewManager;

		override public function initialize():void
		{
			trace("==SomePopUpMediator onRegister");
			eventMap.mapListener(eventDispatcher, SomePopUpEvent.CLOSE_POPUP, onClosePopup, SomePopUpEvent);
		}

		private function onClosePopup(event:SomePopUpEvent):void
		{
			if (event.popUpData && event.popUpData.indexOf(view.title)!=-1 || event.popUpData=="all")
				view.onCloseWindow();
		}

		override public function destroy():void
		{
			dispatch(new SomePopUpEvent(SomePopUpEvent.POPUP_CLOSED, null, view.title));
			viewManager.removeContainer(view);
			super.destroy();
			trace("SomePopUpMediator.destroy()");
		}
	}
}