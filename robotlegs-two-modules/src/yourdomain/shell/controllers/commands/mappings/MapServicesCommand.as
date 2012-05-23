package yourdomain.shell.controllers.commands.mappings
{
	import flash.events.IEventDispatcher;

	import org.swiftsuspenders.Injector;

	import yourdomain.shell.controllers.events.ApplicationConfigEvent;

	/**
	 *
	 * @author Ondina D. F.
	 */
	public class MapServicesCommand
	{
		[Inject]
		public var injector:Injector;

		[Inject]
		public var localDispatcher:IEventDispatcher;

		public function execute():void
		{
			//no mappings yet
			configureSQLService();
		}

		protected function configureSQLService():void
		{
			localDispatcher.dispatchEvent(new ApplicationConfigEvent(ApplicationConfigEvent.CONFIGURE_SERVICES_COMPLETE));
		}
	}
}
