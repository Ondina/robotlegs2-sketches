package yourdomain.shell.views.mediators
{
	import flash.events.IEventDispatcher;

	import robotlegs.bender.bundles.mvcs.Mediator;

	import yourdomain.common.controllers.events.ApplicationInfoEvent;

	public class ShellApplicationMediator extends Mediator
	{
		[Inject]
		public var view:ShellApplication;

		[Inject(name="global")]
		public var defaultDispatcher:IEventDispatcher;

		[Inject]
		public var localDispatcher:IEventDispatcher;

		public function ShellApplicationMediator()
		{
			super();
		}

		override public function initialize():void
		{
			trace("==ShellApplicationMediator initialize");
			eventMap.mapListener(defaultDispatcher, ApplicationInfoEvent.USER_LOGGED_IN_LOCALLY, onLoggedIn, ApplicationInfoEvent);
			addViewListener(ApplicationInfoEvent.LOGGED_OUT, onLoggedOut, ApplicationInfoEvent);
		}

		/*============================================================================*/
		/* Logged In                                                     				*/
		/*============================================================================*/
		private function onLoggedIn(event:ApplicationInfoEvent):void
		{
			view.onLoggedIn(event.message);
		}

		/*============================================================================*/
		/* Logged Out                                                     				*/
		/*============================================================================*/
		private function onLoggedOut(event:ApplicationInfoEvent):void
		{
			localDispatcher.dispatchEvent(event); //StartView will change states
			view.onLoggedOut();
		}
	}
}
