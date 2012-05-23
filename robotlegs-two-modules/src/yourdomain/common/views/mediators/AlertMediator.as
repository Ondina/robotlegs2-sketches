package yourdomain.common.views.mediators
{
	import flash.events.IEventDispatcher;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import yourdomain.common.controllers.events.AlertEvent;
	import yourdomain.common.views.components.AlertView;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class AlertMediator extends Mediator
	{
		[Inject]
		public var view:AlertView;

		[Inject(name="global")]
		public var defaultDispatcher:IEventDispatcher;

		public function AlertMediator()
		{
			super();
		}

		override public function initialize():void
		{
			trace("==AlertMediator initialize");
			eventMap.mapListener(defaultDispatcher, AlertEvent.INFO_ALERT, onInfoAlert, AlertEvent);
			eventMap.mapListener(defaultDispatcher, AlertEvent.ERROR_ALERT, onErrorAlert, AlertEvent);
			eventMap.mapListener(defaultDispatcher, AlertEvent.CLOSE_ALERT, onCloseAlert, AlertEvent);
		}

		protected function onInfoAlert(event:AlertEvent):void
		{
			view.openAlertView(event.message, "info");
		}

		protected function onErrorAlert(event:AlertEvent):void
		{
			view.openAlertView(event.message, "alert");
		}

		protected function onCloseAlert(event:AlertEvent):void
		{
			view.closeAlertView();
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
			super.destroy();
		}
	}
}
