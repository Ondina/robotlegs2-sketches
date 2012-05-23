package yourdomain.common.controllers.commands.popups
{
	import mx.managers.PopUpManager;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.viewManager.api.IViewManager;
	
	import yourdomain.common.controllers.events.SomePopUpEvent;
	import yourdomain.common.views.components.SomePopUpView;
	import yourdomain.modules.popupStuff.views.components.SomeView;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class SomePopUpCommand
	{
		[Inject]
		public var viewManager:IViewManager;

		[Inject]
		public var injector:Injector;

		[Inject]
		public var event:SomePopUpEvent;

		public function execute():void
		{
			var titleWindowInstance:SomePopUpView=injector.getInstance(SomePopUpView);
			titleWindowInstance.title=event.popUpData;
			/*titleWindowInstance.width=500;
			titleWindowInstance.height=500;*/
									
			viewManager.addContainer(titleWindowInstance);
			
			//PopUpManager.addPopUp(titleWindowInstance, FlexGlobals.topLevelApplication as DisplayObject);
			PopUpManager.addPopUp(titleWindowInstance, event.popUpOwner);	
			PopUpManager.centerPopUp(titleWindowInstance);
			
			var popUpChild:*=injector.getInstance(SomeView);
			if (popUpChild)
				titleWindowInstance.addElement(popUpChild);		
		}
	}
}
