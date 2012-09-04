package robotlegs.bender.example.simpleaway3d.commands
{
	import away3d.containers.View3D;
	
	import robotlegs.bender.example.simpleaway3d.views.ISampleView;
	import robotlegs.bender.example.simpleaway3d.views.SampleView;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class Setup3DSceneCommand extends Command
	{
		[Inject]
		public var view:View3D;
		
		override public function execute():void
		{
			var sampleView:ISampleView = new SampleView();
			view.scene.addChild(SampleView(sampleView));
		}
		
	}
}