package yourdomain.modules.loginModule.controllers.commands
{
	import com.probertson.data.SQLRunner;

	import flash.filesystem.File;

	import org.swiftsuspenders.Injector;

	import yourdomain.modules.loginModule.services.ILoginLocallyService;
	import yourdomain.modules.loginModule.services.LoginLocallyService;

	public class MapLocalServicesCommand
	{
		private static const DB_FILE_NAME:String="data/UsersDatabase.db";

		[Inject]
		public var injector:Injector;

		public function execute():void
		{
			configureSQLService();
		}

		protected function configureSQLService():void
		{
			var dbFile:File=File.applicationDirectory.resolvePath(DB_FILE_NAME);
			var sqlRunner:SQLRunner=new SQLRunner(dbFile);

			injector.map(SQLRunner).toValue(sqlRunner);
			injector.map(ILoginLocallyService).toSingleton(LoginLocallyService);
		}
	}
}
