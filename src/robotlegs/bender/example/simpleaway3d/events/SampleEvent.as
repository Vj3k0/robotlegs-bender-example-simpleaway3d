package robotlegs.bender.example.simpleaway3d.events
{
	import flash.events.Event;
	
	public class SampleEvent extends Event
	{
		public static const ACTIVATED:String = "com.bombagames.robostar.events.SampleEvent.ACTIVATED";
		
		public static const UPDATE_COLOR:String = "com.bombagames.robostar.events.SampleEvent.UPDATE_COLOR";
		
		public static const SETUP_COMPLETE:String = "com.bombagames.rs.demo.events.SampleEvent.SETUP_COMPLETE";
		
		public function SampleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}