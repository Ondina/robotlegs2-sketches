package yourdomain.common.controllers.events
{
	import flash.events.Event;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class InterModularEvent extends Event
	{
		public static const MODULE_TO_MODULE:String="moduleToModule";
		public static const MODULE_TO_SHELL:String="moduleToShell";
		public static const SHELL_TO_MODULE:String="shellToModule";
		
		public static const LOAD_MODULES:String="loadModules";
		public static const UNLOAD_MODULES:String="unloadModules";

		private var _modulesVO:*;

		public function InterModularEvent(type:String, modulesVO:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_modulesVO=modulesVO;
		}

		public function get modulesVO():*
		{
			return _modulesVO;
		}

		override public function clone():Event
		{
			return new InterModularEvent(type, modulesVO, bubbles, cancelable);
		}
	}
}
