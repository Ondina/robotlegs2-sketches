# ShellApplication

This is an AIR application. ShellApplication.mxl=WindowedApplication.

## Creating a Robotlegs 2 Context

	import yourdomain.shell.context.ApplicationConfig;
	
	protected var applicationConfig:ApplicationConfig;

	protected function onPreinitialize(event:FlexEvent):void
	{
		applicationConfig=new ApplicationConfig(this);
	}

On FlexEvent.PREINITIALIZE: ApplicationConfig is given a reference to *this* as Display Object Container, which , in this case, is the WindowedApplication. 
It will be used as the *contextView*.

