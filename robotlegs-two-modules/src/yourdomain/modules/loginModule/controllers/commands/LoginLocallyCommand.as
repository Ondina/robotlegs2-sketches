package  yourdomain.modules.loginModule.controllers.commands
{
	import yourdomain.modules.loginModule.controllers.events.LoginEvent;
	import yourdomain.modules.loginModule.services.ILoginLocallyService;
	

	public class LoginLocallyCommand
	{
		[Inject]
		public var service:ILoginLocallyService;

		[Inject]
		public var event:LoginEvent;
				
		public function execute():void
		{
			service.accessResources(event.loginData);
		}
	}
}