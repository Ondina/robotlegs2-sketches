package yourdomain.shell.controllers.commands.mappings
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	
	import yourdomain.common.views.components.AlertView;
	import yourdomain.common.views.components.SomePopUpView;
	import yourdomain.common.views.mediators.AlertMediator;
	import yourdomain.common.views.mediators.SomePopUpMediator;
	import yourdomain.modules.popupStuff.views.mediators.SomeMediator;
	import yourdomain.modules.popupStuff.views.components.SomeView;
	import yourdomain.shell.views.components.ChatMasterView;
	import yourdomain.shell.views.components.MainNavigationView;
	import yourdomain.shell.views.components.PopupsMasterView;
	import yourdomain.shell.views.components.StartView;
	import yourdomain.shell.views.mediators.ChatMasterMediator;
	import yourdomain.shell.views.mediators.MainNavigationMediator;
	import yourdomain.shell.views.mediators.PopupsMasterMediator;
	import yourdomain.shell.views.mediators.ShellApplicationMediator;
	import yourdomain.shell.views.mediators.StartMediator;
	
	/**
	 *
	 * @author Ondina D. F.
	 */
	public class MapViewsCommand
	{
		[Inject]
		public var mediatorMap:IMediatorMap;

		public function execute():void
		{
			mediatorMap.map(AlertView).toMediator(AlertMediator);
			mediatorMap.map(StartView).toMediator(StartMediator);
			mediatorMap.map(ChatMasterView).toMediator(ChatMasterMediator);
			mediatorMap.map(PopupsMasterView).toMediator(PopupsMasterMediator);
			mediatorMap.map(SomePopUpView).toMediator(SomePopUpMediator);
			mediatorMap.map(SomeView).toMediator(SomeMediator);
			mediatorMap.map(MainNavigationView).toMediator(MainNavigationMediator);
			
			mediatorMap.map(ShellApplication).toMediator(ShellApplicationMediator);
		}
	}
}
