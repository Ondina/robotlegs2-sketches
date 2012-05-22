package yourdomain.modules.popupStuff.models
{
	public class SomeVO
	{
		private var _user_id:String;
		private var _user_name:String;
		private var _user_password:String;

		private var _someMessage:String;

		public function SomeVO()
		{
		}

		public function get someMessage():String
		{
			return _someMessage;
		}

		public function set someMessage(value:String):void
		{
			_someMessage=value;
		}

		public function get user_id():String
		{
			return _user_id;
		}

		public function set user_id(value:String):void
		{
			_user_id=value;
		}

		public function get user_name():String
		{
			return _user_name;
		}

		public function set user_name(value:String):void
		{
			_user_name=value;
		}

		public function get user_password():String
		{
			return _user_password;
		}

		public function set user_password(value:String):void
		{
			_user_password=value;
		}

		public function resetAll():void
		{
			user_password="";
			user_name="";
		}
	}
}
