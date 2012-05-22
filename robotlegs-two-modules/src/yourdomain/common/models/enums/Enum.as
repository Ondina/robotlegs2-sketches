package yourdomain.common.models.enums
{
	/**
	 * A base class for enumerations
	 */
	[Bindable] public class Enum
	{
		public var name:String;
		public var ordinal:Number;
		public var description:String;
		public var color:String;
		
		public function Enum( ordinal:Number, name:String,color:String, description:String )
		{
			this.name = name;
			this.ordinal = ordinal;
			this.description = description;
			this.color = color;
		}

		/**
		 * Compare to another enum instance
		 */
		public function equals( enum:Enum ):Boolean
		{
			return ( ( this.ordinal 	== enum.ordinal ) && 
					 ( this.name 		== enum.name )&& 
					 ( this.color 		== enum.color )&& 
					 ( this.description == enum.description ) 
				   );
		}		
	}
}