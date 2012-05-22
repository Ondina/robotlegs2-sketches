package yourdomain.common.controllers.interfaces
{
	import yourdomain.common.models.vo.ModulesVO;

	public interface IModules
	{
		function set modulesVO(value:ModulesVO):void;
		function get modulesVO():ModulesVO;
	}
}
