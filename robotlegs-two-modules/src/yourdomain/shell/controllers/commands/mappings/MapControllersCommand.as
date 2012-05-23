package yourdomain.shell.controllers.commands.mappings
{
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;

	import yourdomain.common.controllers.commands.popups.SomePopUpCommand;
	import yourdomain.common.controllers.events.SomePopUpEvent;

	/**
	 *
	 * @author Ondina D. F.
	 */
	public class MapControllersCommand
	{
		[Inject]
		public var commandMap:IEventCommandMap;

		public function execute():void
		{
			commandMap.map(SomePopUpEvent.OPEN_POPUP, SomePopUpEvent).toCommand(SomePopUpCommand);
		}
	}
}
