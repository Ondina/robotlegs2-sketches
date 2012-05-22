package yourdomain.shell.controllers.events
{
	import flash.events.Event;

	/**
	 *
	 * @author Ondina D.F.
	 *
	 */
	public class ApplicationConfigEvent extends Event
	{
		public static const START_MAPPING:String="startMapping";
		public static const MAPPING_COMPLETE:String="mappingComplete";

		public static const CONFIGURE_SERVICES:String="configureServices";
		public static const CONFIGURE_DATABASE:String="configureDatabase";
		
		public static const CONFIGURE_DATABASE_COMPLETE:String="configureDatabaseComplete";
		public static const CONFIGURE_SERVICES_COMPLETE:String="configureServicesComplete";		
		public static const CONFIGURATION_COMPLETE:String="configurationComplete";

		public function ApplicationConfigEvent(type:String,  bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new ApplicationConfigEvent(type, bubbles, cancelable);
		}
	}
}
