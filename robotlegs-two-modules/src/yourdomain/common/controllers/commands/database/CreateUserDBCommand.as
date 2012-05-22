package yourdomain.common.controllers.commands.database
{
	import com.probertson.data.QueuedStatement;
	import com.probertson.data.SQLRunner;
	
	import flash.data.SQLResult;
	import flash.errors.SQLError;
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	
	import org.swiftsuspenders.Injector;
	
	import yourdomain.shell.controllers.events.ApplicationConfigEvent;

	public class CreateUserDBCommand
	{
		private static const DB_FILE_NAME:String="data/UsersDatabase.db";

		private var sqlRunner:SQLRunner;

		[Inject]
		public var injector:Injector;

		[Inject]
		public var localDispatcher:IEventDispatcher;
		
		public function CreateUserDBCommand()
		{
		}

		public function execute():void
		{
			trace("CreateUserDBCommand.execute() ");			
			var dbFile:File=File.applicationDirectory.resolvePath(DB_FILE_NAME);
			sqlRunner=new SQLRunner(dbFile);
			injector.map(SQLRunner).toValue(sqlRunner);
			if (dbFile.exists)
				localDispatcher.dispatchEvent(new ApplicationConfigEvent(ApplicationConfigEvent.CONFIGURE_DATABASE_COMPLETE));
			else								
				createDatabaseStructure();
		}

		public function createDatabaseStructure():void
		{
			var stmts:Vector.<QueuedStatement>=new Vector.<QueuedStatement>();
			stmts[stmts.length]=new QueuedStatement(CREATE_USERS_SQL);
			stmts[stmts.length]=new QueuedStatement(POPULATE_USERS_SQL);
			sqlRunner.executeModify(stmts, executeBatch_complete, executeBatch_error, null);
		}

		private function executeBatch_complete(results:Vector.<SQLResult>):void
		{
			//trace("CreateUserDBCommand.executeBatch_complete(results)");
			localDispatcher.dispatchEvent(new ApplicationConfigEvent(ApplicationConfigEvent.CONFIGURE_DATABASE_COMPLETE));
		}

		private function executeBatch_error(error:SQLError):void
		{
			trace("CreateUserDBCommand.executeBatch_error(error) "+error.message);
			//localDispatcher.dispatchEvent(new SQLErrorEvent(SQLErrorEvent.ERROR, false, false, error));
		}

		// ------- SQL statements -------
		[Embed(source="sql/create/CreateTableUsers.sql", mimeType="application/octet-stream")]
		private static const CreateUsersStatementText:Class;
		private static const CREATE_USERS_SQL:String=new CreateUsersStatementText();

		[Embed(source="sql/create/PopulateUsers.sql", mimeType="application/octet-stream")]
		private static const PopulateUsersStatementText:Class;
		private static const POPULATE_USERS_SQL:String=new PopulateUsersStatementText();
	}
}
