package yourdomain.shell.views.mediators
{
	import flash.events.IEventDispatcher;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import yourdomain.common.controllers.events.AlertEvent;
	import yourdomain.common.controllers.events.ApplicationInfoEvent;
	import yourdomain.common.controllers.events.SomePopUpEvent;
	import yourdomain.shell.controllers.events.ApplicationConfigEvent;
	import yourdomain.shell.views.components.StartView;

	public class StartMediator extends Mediator
	{
		[Inject]
		public var view:StartView;

		[Inject(name="global")]
		public var defaultDispatcher:IEventDispatcher;
		
		[Inject]
		public var localDispatcher:IEventDispatcher;

		public function StartMediator()
		{
			super();
		}

		override public function initialize():void
		{
			trace("[==============================================================");
			trace("==StartMediator.initialize");			
			addContextListener(ApplicationConfigEvent.CONFIGURATION_COMPLETE, onConfigurationComplete, ApplicationConfigEvent);
			eventMap.mapListener(defaultDispatcher, ApplicationInfoEvent.USER_LOGGED_IN_LOCALLY, onLoggedIn, ApplicationInfoEvent);
			addContextListener(ApplicationInfoEvent.LOGGED_OUT, onLoggedOut, ApplicationInfoEvent);
		}
		
		/*============================================================================*/
		/* robotlegs context and mappings done                                      	*/
		/*============================================================================*/	
		private function onConfigurationComplete(event:ApplicationConfigEvent=null):void
		{
			trace("StartMediator.onConfigurationComplete(event)");			
			view.initView();
		}

		/*============================================================================*/
		/* Logged In                                                     				*/
		/*============================================================================*/	
		private function onLoggedIn(event:ApplicationInfoEvent):void
		{
			cleanUp();
			view.onLoggedIn(event.message);
		}

		/*============================================================================*/
		/* Logged Out                                                     				*/
		/*============================================================================*/
		private function onLoggedOut(event:ApplicationInfoEvent):void
		{
			trace("StartMediator.onLoggedOut(event)");	
			localDispatcher.dispatchEvent(new SomePopUpEvent(SomePopUpEvent.CLOSE_POPUP, null, "all"));	
			defaultDispatcher.dispatchEvent(new AlertEvent(AlertEvent.CLOSE_ALERT));
			view.onLoggedOut();
		}

		/*============================================================================*/
		/* Clean up                                              				*/
		/*============================================================================*/
		private function cleanUp():void
		{
			eventMap.unmapListener(eventDispatcher, ApplicationConfigEvent.CONFIGURATION_COMPLETE, onConfigurationComplete, ApplicationConfigEvent);
		}
	}
}
