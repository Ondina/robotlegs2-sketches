package yourdomain.shell.context
{
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;

	import mx.events.FlexEvent;

	import org.swiftsuspenders.Injector;

	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.scopedEventDispatcher.ScopedEventDispatcherExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	import yourdomain.common.controllers.commands.database.CreateUserDBCommand;
	import yourdomain.shell.controllers.commands.mappings.MapControllersCommand;
	import yourdomain.shell.controllers.commands.mappings.MapServicesCommand;
	import yourdomain.shell.controllers.commands.mappings.MapViewsCommand;
	import yourdomain.shell.controllers.events.ApplicationConfigEvent;

	public class ApplicationConfig
	{
		private var localDispatcher:IEventDispatcher;
		private var injector:Injector;
		private var commandMap:IEventCommandMap;
		private var context:IContext;
		private var _contextView:DisplayObjectContainer;
		private var mediatorMap:IMediatorMap;

		public function ApplicationConfig(contextView:DisplayObjectContainer):void
		{
			trace("[shell start==============================================================>");
			trace("1. ApplicationConfig.ApplicationConfig(contextView) ");
			_contextView=contextView;
			_contextView.addEventListener(FlexEvent.APPLICATION_COMPLETE, onApplicationComplete);

			cofigureRLContext();
		}

		private function cofigureRLContext():void
		{
			trace("2. ApplicationConfig.cofigureRLContext()");
			context=new Context();
			context.extend(MVCSBundle);
			context.extend(new ScopedEventDispatcherExtension("global", "channelOne", "channelTwo"));
			context.configure(_contextView);
			injector=context.injector;
			commandMap=injector.getInstance(IEventCommandMap);
			mediatorMap=injector.getInstance(IMediatorMap);
			localDispatcher=injector.getInstance(IEventDispatcher);

			mapMappingCommands();
		}

		private function mapMappingCommands():void
		{
			trace("3. ApplicationConfig.mapMappingCommands(contextView)");
			//not used yet:
			//commandMap.map(ApplicationConfigEvent.START_MAPPING, ApplicationConfigEvent).toCommand(MapModelsCommand);
			commandMap.map(ApplicationConfigEvent.START_MAPPING, ApplicationConfigEvent).toCommand(MapControllersCommand);
			commandMap.map(ApplicationConfigEvent.START_MAPPING, ApplicationConfigEvent).toCommand(MapViewsCommand);
			commandMap.map(ApplicationConfigEvent.CONFIGURE_SERVICES, ApplicationConfigEvent).toCommand(MapServicesCommand);
			commandMap.map(ApplicationConfigEvent.CONFIGURE_DATABASE, ApplicationConfigEvent).toCommand(CreateUserDBCommand);

			localDispatcher.addEventListener(ApplicationConfigEvent.CONFIGURE_DATABASE_COMPLETE, onDBConfigComplete);
			localDispatcher.addEventListener(ApplicationConfigEvent.CONFIGURE_SERVICES_COMPLETE, onServiceConfigComplete);

			localDispatcher.dispatchEvent(new ApplicationConfigEvent(ApplicationConfigEvent.CONFIGURE_DATABASE));
		}

		private function onDBConfigComplete(event:ApplicationConfigEvent):void
		{
			trace("4. ApplicationConfig.onDBConfigComplete()");
			localDispatcher.dispatchEvent(new ApplicationConfigEvent(ApplicationConfigEvent.CONFIGURE_SERVICES));
		}

		private function onServiceConfigComplete(event:ApplicationConfigEvent):void
		{
			trace("5. ApplicationConfig.onServiceConfigComplete(event)");
			localDispatcher.dispatchEvent(new ApplicationConfigEvent(ApplicationConfigEvent.START_MAPPING));
		}

		private function onApplicationComplete(event:FlexEvent):void
		{
			trace("6. ApplicationConfig.onApplicationComplete(event)");
			mediatorMap.mediate(_contextView);
			cleanUpAfterConfiguration();
		}

		private function cleanUpAfterConfiguration():void
		{
			trace("7. ApplicationConfig.cleanUpAfterConfiguration()");
			localDispatcher.removeEventListener(ApplicationConfigEvent.MAPPING_COMPLETE, onDBConfigComplete);

			commandMap.unmap(ApplicationConfigEvent.START_MAPPING, ApplicationConfigEvent);
			commandMap.unmap(ApplicationConfigEvent.CONFIGURE_SERVICES, ApplicationConfigEvent);
			commandMap.unmap(ApplicationConfigEvent.CONFIGURE_DATABASE, ApplicationConfigEvent);
			
			_contextView.removeEventListener(FlexEvent.APPLICATION_COMPLETE, onApplicationComplete);
			trace("<==============================================================shell done]");
			localDispatcher.dispatchEvent(new ApplicationConfigEvent(ApplicationConfigEvent.CONFIGURATION_COMPLETE));
		}
	}
}
