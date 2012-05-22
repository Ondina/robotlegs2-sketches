package yourdomain.shell.controllers.commands.mappings
{	
	import org.swiftsuspenders.Injector;

	public class MapModelsCommand
	{
		[Inject]
		public var injector:Injector;

		public function execute():void
		{
			//no mappings yet
			trace("MapModelsCommand.execute()");			
		}
	}
}
