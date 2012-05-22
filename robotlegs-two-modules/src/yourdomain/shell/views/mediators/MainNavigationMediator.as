package yourdomain.shell.views.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import yourdomain.common.controllers.events.ApplicationInfoEvent;
	import yourdomain.shell.views.components.MainNavigationView;

	public class MainNavigationMediator extends Mediator
	{
		[Inject]
		public var view:MainNavigationView;

		public function MainNavigationMediator()
		{
			super();
		}

		override public function initialize():void
		{
			trace("==MainNavigationMediator initialize");
			addViewListener(ApplicationInfoEvent.NAVIGATE_FROM, dispatch, ApplicationInfoEvent);
			view.initView();
		}
	}
}
