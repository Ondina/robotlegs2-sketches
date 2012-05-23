package yourdomain.modules.loginModule.context
{
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.scopedEventDispatcher.ScopedEventDispatcherExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	import yourdomain.modules.loginModule.controllers.commands.LoginLocallyCommand;
	import yourdomain.modules.loginModule.controllers.commands.MapLocalServicesCommand;
	import yourdomain.modules.loginModule.controllers.events.LoginEvent;
	import yourdomain.modules.loginModule.models.LoginVO;
	import yourdomain.modules.loginModule.views.components.LoginView;
	import yourdomain.modules.loginModule.views.mediators.LoginMediator;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class LoginModuleConfig
	{
		private var injector:Injector;
		private var mediatorMap:IMediatorMap;
		private var commandMap:IEventCommandMap;
		private var childContext:IContext;
		private var localDispatcher:IEventDispatcher;

		private var _childContextView:DisplayObjectContainer;

		public function LoginModuleConfig(contextView:DisplayObjectContainer):void
		{
			trace("[login start==============================================================>");
			trace("1. LoginModuleConfig.LoginModuleConfig(contextView) ");
			_childContextView=contextView;
			startConfiguration();
		}

		private function startConfiguration():void
		{
			trace("2. LoginModuleConfig.startConfiguration()");
			childContext=new Context();
			childContext.extend(MVCSBundle);
			childContext.extend(ScopedEventDispatcherExtension);
			//childContext.logLevel=LogLevel.DEBUG;
			childContext.configure(_childContextView);

			injector=childContext.injector;
			commandMap=injector.getInstance(IEventCommandMap);
			localDispatcher=injector.getInstance(IEventDispatcher);
			mediatorMap=injector.getInstance(IMediatorMap);

			startMappings();
		}

		private function startMappings():void
		{
			trace("3. LoginModuleConfig.startMappings()");
			injector.map(LoginVO).asSingleton();

			commandMap.map(LoginEvent.CONFIGURE_LOCAL_SERVICES, LoginEvent).toCommand(MapLocalServicesCommand);
			commandMap.map(LoginEvent.LOG_IN_LOCALLY, LoginEvent).toCommand(LoginLocallyCommand);

			mediatorMap.map(LoginView).toMediator(LoginMediator);
			trace("<==============================================================login done]");
			mediatorMap.mediate(_childContextView);
			
			localDispatcher.dispatchEvent(new LoginEvent(LoginEvent.CONFIGURE_LOCAL_SERVICES));
		}
	}
}
