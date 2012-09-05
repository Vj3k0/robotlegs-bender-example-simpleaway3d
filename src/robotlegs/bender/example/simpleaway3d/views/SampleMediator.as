package robotlegs.bender.example.simpleaway3d.views
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.example.simpleaway3d.events.SampleEvent;
	
	public class SampleMediator extends Mediator
	{
		[Inject]
		public var view:ISampleView;
		
		override public function initialize():void
		{
			addViewListener(SampleViewEvent.VIEW_TRIGGERED, handleTriggered, SampleViewEvent);
			addContextListener(SampleEvent.UPDATE_COLOR, onUpdateColor, SampleEvent);
		}
		
		override public function destroy():void
		{
			removeViewListener(SampleViewEvent.VIEW_TRIGGERED, handleTriggered, SampleViewEvent);
			removeContextListener(SampleEvent.UPDATE_COLOR, onUpdateColor, SampleEvent);
		}
		
		private function handleTriggered(event:SampleViewEvent):void
		{
			dispatch(new SampleEvent(SampleEvent.ACTIVATED));
		}
		
		private function onUpdateColor(event:SampleEvent):void
		{
			view.changeColor();
		}
		
	}
}