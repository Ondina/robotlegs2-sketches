package yourdomain.modules.loginModule.services
{
	import yourdomain.modules.loginModule.models.LoginVO;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public interface ILoginLocallyService
	{
		function accessResources(loginModel:LoginVO):void;
	}
}