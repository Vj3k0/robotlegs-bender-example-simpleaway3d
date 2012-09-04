package
{
	import robotlegs.bender.example.simpleaway3d.RADemo;
	
	import flash.display.Sprite;
	
	[SWF(width="550", height="400", frameRate="60", backgroundColor="#222222")]
	public class RobotlegsAway3D extends Sprite
	{
		public function RobotlegsAway3D()
		{
			addChild(new RADemo());
		}
	}
}