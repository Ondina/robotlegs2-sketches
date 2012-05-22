package yourdomain.shell.views.mediators
{
	import flash.events.IEventDispatcher;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import yourdomain.common.controllers.events.AlertEvent;
	import yourdomain.common.controllers.events.InterModularEvent;
	import yourdomain.shell.views.components.ChatMasterView;
	
	public class ChatMasterMediator extends Mediator
	{
		[Inject]
		public var view:ChatMasterView;
		
		[Inject(name="global")]
		public var defaultDispatcher:IEventDispatcher;
		
		public function ChatMasterMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			trace("==ChatMasterMediator initialize");
			addViewListener(AlertEvent.ERROR_ALERT, defaultDispatcher.dispatchEvent, AlertEvent);
			addViewListener(InterModularEvent.SHELL_TO_MODULE, defaultDispatcher.dispatchEvent, InterModularEvent);
			
			eventMap.mapListener(defaultDispatcher,InterModularEvent.MODULE_TO_SHELL, onMessageReceived, InterModularEvent);
			eventMap.mapListener(defaultDispatcher,InterModularEvent.MODULE_TO_MODULE, onMessageReceived, InterModularEvent);
			eventMap.mapListener(defaultDispatcher,InterModularEvent.UNLOAD_MODULES, onUnloadModule, InterModularEvent);
			
			view.initView();
		}
		
		private function onUnloadModule(event:InterModularEvent):void
		{
			view.onUnloadModule(event.modulesVO);
		}
		
		private function onMessageReceived(event:InterModularEvent):void
		{
			view.onMessageReceived(event.modulesVO);
		}
		
		override public function destroy():void
		{
			eventMap.unmapListeners();
			super.destroy();
			trace("ChatMasterMediator.destroy()");
		}
	}
}
