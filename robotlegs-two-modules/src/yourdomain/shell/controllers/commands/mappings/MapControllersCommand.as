package yourdomain.shell.controllers.commands.mappings
{	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	
	import yourdomain.common.controllers.commands.popups.SomePopUpCommand;
	import yourdomain.common.controllers.events.SomePopUpEvent;

	public class MapControllersCommand
	{
		[Inject]
		public var commandMap:IEventCommandMap;

		public function execute():void
		{
			trace("MapControllersCommand.execute()");
			commandMap.map(SomePopUpEvent.OPEN_POPUP, SomePopUpEvent).toCommand(SomePopUpCommand);
		}
	}
}
