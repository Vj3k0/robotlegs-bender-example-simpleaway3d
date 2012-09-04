package robotlegs.bender.example.simpleaway3d.views
{
	import flash.events.Event;
	
	public class SampleViewEvent extends Event
	{
		public static const VIEW_TRIGGERED:String = "robotlegs.bender.example.simpleaway3d.views.SampleViewEvent.VIEW_TRIGGERED";
		
		public function SampleViewEvent(type:String)
		{
			super(type);
		}
	}
}