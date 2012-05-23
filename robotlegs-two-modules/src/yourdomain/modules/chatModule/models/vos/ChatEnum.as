package yourdomain.modules.chatModule.models.vos
{
	import mx.collections.ArrayCollection;

	import yourdomain.common.models.enums.Enum;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class ChatEnum extends Enum
	{
		public static const GLOBAL_CHANNEL:ChatEnum=new ChatEnum(0, "global", "#bc063e", "Choose a Channel");
		public static const CHANNEL_ONE:ChatEnum=new ChatEnum(1, "channelOne", "#0b53ad", "Choose a Channel");
		public static const CHANNEL_TWO:ChatEnum=new ChatEnum(2, "channelTwo", "#068335", "Choose a Channel");

		public function ChatEnum(ordinal:Number, name:String, color:String, description:String)
		{
			super(ordinal, name, color, description);
		}

		public static function get customChannels():Array
		{
			return [CHANNEL_ONE, CHANNEL_TWO];
		}

		public static function get list():Array
		{
			return [GLOBAL_CHANNEL, CHANNEL_ONE, CHANNEL_TWO];
		}

		public static function get comboList():ArrayCollection
		{
			return new ArrayCollection([GLOBAL_CHANNEL].concat(customChannels));
		}

		override public function equals(enum:Enum):Boolean
		{
			return (enum is ChatEnum && super.equals(enum));
		}
	}
}
