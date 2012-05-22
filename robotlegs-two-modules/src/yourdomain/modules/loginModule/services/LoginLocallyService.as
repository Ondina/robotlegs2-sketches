package yourdomain.modules.loginModule.services
{
	import com.probertson.data.SQLRunner;
	
	import flash.data.SQLResult;
	import flash.events.IEventDispatcher;
	
	import yourdomain.common.controllers.events.AlertEvent;
	import yourdomain.common.controllers.events.ApplicationInfoEvent;
	import yourdomain.modules.loginModule.models.LoginVO;

	public class LoginLocallyService implements ILoginLocallyService
	{
		[Inject(name="global")]
		public var defaultDispatcher:IEventDispatcher;

		[Inject]
		public var sqlRunner:SQLRunner;

		public function accessResources(loginModel:LoginVO):void
		{
			trace("LoginLocallyService.accessResources() " + loginModel.user_name + " " + loginModel.user_password);
			sqlRunner.execute(LOAD_USER_SQL, {user_name: loginModel.user_name, user_password: loginModel.user_password}, onLoginResult, LoginVO);
		}

		private function onLoginResult(result:SQLResult):void
		{
			trace("LoginLocallyService.onLoginResult(result)");
			var faultMessage:String;
			if (result.data != null && result.data.length > 0)
			{
				cleanUp();
				defaultDispatcher.dispatchEvent(new ApplicationInfoEvent(ApplicationInfoEvent.USER_LOGGED_IN_LOCALLY, result.data[0].user_name));				
			}
			else
			{
				faultMessage="User not found or database is empty.";
				defaultDispatcher.dispatchEvent(new AlertEvent(AlertEvent.ERROR_ALERT, faultMessage));
			}
		}

		/*private function database_error(error:SQLError):void
		{
			trace("SQLContactService.database_error(error)");
			defaultDispatcher.dispatchEvent(new SQLErrorEvent(SQLErrorEvent.ERROR, false, false, error));
		}*/
		
		private function cleanUp():void
		{
			sqlRunner=null;
		}
		// ------- SQL statements -------
		[Embed(source="sql/LoadUser.sql", mimeType="application/octet-stream")]
		private static const LoadUserStatementText:Class;
		private static const LOAD_USER_SQL:String=new LoadUserStatementText();
	}
}
