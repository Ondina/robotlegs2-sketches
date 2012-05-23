package  yourdomain.modules.chatModule.context
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
	
	import yourdomain.modules.chatModule.views.components.ChatView;
	import yourdomain.modules.chatModule.views.mediators.ChatMediator;

	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class ChatConfig
	{
		private var injector:Injector;
		private var mediatorMap:IMediatorMap;
		private var commandMap:IEventCommandMap;
		private var childContext:IContext;
		
		private var _childContextView:DisplayObjectContainer;
		private var _customDispatcher:String;

		public function ChatConfig(contextView:DisplayObjectContainer, customDispatcher:String=null):void
		{
			trace("[chat start==============================================================>");
			trace("1. ChatConfig.(contextView) customDispatcher "+customDispatcher);
			_childContextView=contextView;
			_customDispatcher=customDispatcher;
			cofigureRLContext();
		}

		private function cofigureRLContext():void
		{
			trace("2. ChatConfig.startConfiguration()");
			childContext=new Context();
			childContext.extend(MVCSBundle);
			childContext.extend(new ScopedEventDispatcherExtension("global",_customDispatcher));			
			//childContext.logLevel=LogLevel.DEBUG;
			childContext.configure(_childContextView);
			injector=childContext.injector;
			mediatorMap=injector.getInstance(IMediatorMap);

			startMappings();
		}

		private function startMappings():void
		{
			trace("3. ChatConfig.startMappings()");
			mediatorMap.map(ChatView).toMediator(ChatMediator);
			trace("<==============================================================chat done]");
			mediatorMap.mediate(_childContextView);
		}
	}
}
