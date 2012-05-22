package yourdomain.modules.chatModule.views.mediators
{
	import flash.events.IEventDispatcher;

	import org.swiftsuspenders.Injector;

	import robotlegs.bender.bundles.mvcs.Mediator;

	import yourdomain.common.controllers.events.InterModularEvent;
	import yourdomain.modules.chatModule.views.components.ChatView;

	public class ChatMediator extends Mediator
	{
		[Inject]
		public var view:ChatView;

		[Inject]
		public var injector:Injector;

		[Inject(name="global")]
		public var defaultDispatcher:IEventDispatcher;

		private var customDispatcher:IEventDispatcher;

		public function ChatMediator()
		{
			super();
		}

		override public function initialize():void
		{
			trace("==ChatMediator initialize " + view.moduleName);
			setInterModularDispatcher();

			addViewListener(InterModularEvent.UNLOAD_MODULES, defaultDispatcher.dispatchEvent, InterModularEvent);
			addViewListener(InterModularEvent.MODULE_TO_SHELL, defaultDispatcher.dispatchEvent, InterModularEvent);
			eventMap.mapListener(defaultDispatcher, InterModularEvent.SHELL_TO_MODULE, onShellToModuleMessage, InterModularEvent);
		}

		private function setInterModularDispatcher():void
		{
			customDispatcher=injector.getInstance(IEventDispatcher, view.customDispatcher);
			eventMap.mapListener(customDispatcher, InterModularEvent.MODULE_TO_MODULE, onIntermodularMessage, InterModularEvent);
			addViewListener(InterModularEvent.MODULE_TO_MODULE, customDispatcher.dispatchEvent, InterModularEvent);
		}

		private function onShellToModuleMessage(event:InterModularEvent):void
		{
			view.onMessageReceived(event.modulesVO);
		}

		private function onIntermodularMessage(event:InterModularEvent):void
		{
			if (event.modulesVO.moduleName != view.moduleName)
				view.onMessageReceived(event.modulesVO);
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
			super.destroy();
			trace("ChatMediator.destroy() " + view.moduleName);
		}
	}
}
