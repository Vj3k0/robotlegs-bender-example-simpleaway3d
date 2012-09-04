package robotlegs.bender.example.simpleaway3d.commands
{
	import robotlegs.bender.example.simpleaway3d.events.SampleEvent;
	
	import flash.events.IEventDispatcher;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class SampleCommand extends Command
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		override public function execute():void
		{
			eventDispatcher.dispatchEvent(new SampleEvent(SampleEvent.UPDATE_COLOR));
		}
		
	}
}