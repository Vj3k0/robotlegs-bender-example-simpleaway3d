package robotlegs.bender.example.simpleaway3d.config
{
	import robotlegs.bender.example.simpleaway3d.commands.SampleCommand;
	import robotlegs.bender.example.simpleaway3d.commands.Setup3DSceneCommand;
	import robotlegs.bender.example.simpleaway3d.events.SampleEvent;
	import robotlegs.bender.example.simpleaway3d.views.ISampleView;
	import robotlegs.bender.example.simpleaway3d.views.SampleMediator;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.LogLevel;
	import robotlegs.extensions.away3dViewMap.api.Away3DViewMapEvent;

	public class Config
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject]
		public var context:IContext;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:IEventCommandMap;
		
		[Inject]
		public var injector:Injector;
		
		//---------------------------------------------------------------
		// Configuration
		//---------------------------------------------------------------
		
		[PostConstruct]
		public function init():void
		{
			context.logLevel = LogLevel.DEBUG;
			
			commandMap
			.map(Away3DViewMapEvent.STARTUP_COMPLETE)
				.toCommand(Setup3DSceneCommand);
			commandMap
			.map(SampleEvent.ACTIVATED, SampleEvent)
				.toCommand(SampleCommand);
			
			mediatorMap
			.map(ISampleView)
				.toMediator(SampleMediator);
			
//			context.lifecycle.afterInitializing(initComplete);
		}
		
		/*private function initComplete():void
		{
			eventDispatcher.dispatchEvent(new SampleEvent(SampleEvent.SETUP_COMPLETE));
		}*/
	}
}