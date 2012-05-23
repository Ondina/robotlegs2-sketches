package yourdomain.modules.loginModule.views.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import yourdomain.modules.loginModule.controllers.events.LoginEvent;
	import yourdomain.modules.loginModule.views.components.LoginView;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class LoginMediator extends Mediator
	{
		[Inject]
		public var view:LoginView;
		
		public function LoginMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			trace("==LoginMediator initialize");
			addViewListener(LoginEvent.LOG_IN_LOCALLY, dispatch, LoginEvent);
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
			super.destroy();
			trace("LoginMediator.destroy()");
		}
	}
}
