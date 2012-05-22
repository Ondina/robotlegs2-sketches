package yourdomain.modules.loginModule.services
{
	import yourdomain.modules.loginModule.models.LoginVO;

	public interface ILoginLocallyService
	{
		function accessResources(loginModel:LoginVO):void;
	}
}