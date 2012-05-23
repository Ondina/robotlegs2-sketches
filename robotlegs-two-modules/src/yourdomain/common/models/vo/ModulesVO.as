package yourdomain.common.models.vo
{
	import yourdomain.modules.chatModule.models.vos.ChatEnum;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class ModulesVO
	{
		private var _moduleColor:String;
		private var _channelsColor:String;

		private var _moduleName:String;
		private var _customDispatcher:String;
		private var _channelNumber:int;
		protected var _messageContent:String;
		
		public function ModulesVO()
		{
		}

		public function get messageContent():String
		{
			return _messageContent;
		}

		public function set messageContent(value:String):void
		{
			_messageContent=value;
		}

		public function get channelsColor():String
		{
			_channelsColor=ChatEnum.list[channelNumber].color;
			return _channelsColor;
		}

		public function set channelsColor(value:String):void
		{
			_channelsColor=value;
		}

		public function get moduleColor():String
		{
			return _moduleColor;
		}

		public function set moduleColor(value:String):void
		{
			_moduleColor=value;
		}

		public function get channelNumber():int
		{
			return _channelNumber;
		}

		public function set channelNumber(value:int):void
		{
			_channelNumber=value;
		}

		public function get customDispatcher():String
		{
			return _customDispatcher;
		}

		public function set customDispatcher(value:String):void
		{
			_customDispatcher=value;
		}

		public function get moduleName():String
		{
			return _moduleName;
		}

		public function set moduleName(value:String):void
		{
			_moduleName=value;
		}
	}
}
