package robotlegs.bender.example.simpleaway3d.views
{
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.events.MouseEvent3D;
	import away3d.events.Object3DEvent;
	import away3d.events.Scene3DEvent;
	import away3d.materials.ColorMaterial;
	import away3d.primitives.PlaneGeometry;
	
	import robotlegs.extensions.away3dViewMap.api.IAutoInit;
	
	public class SampleView extends ObjectContainer3D implements ISampleView, IAutoInit
	{
		private var _mesh:Mesh;
		private var _planeGeometry:PlaneGeometry;
		private var _material:ColorMaterial;
		
		public function SampleView()
		{
			super();
			
//			Create view when object is create
			_planeGeometry = new PlaneGeometry(700, 700);
			_material = new ColorMaterial(0xFF0000);
			_mesh = new Mesh(_planeGeometry, _material);
			_mesh.mouseEnabled = true;
			_planeGeometry = null;
			addChild(_mesh);
			
//			this.addEventListener(Object3DEvent.SCENE_CHANGED, onSceneChanged, false, 0, true);
		}
		
		/*private function onSceneChanged(event:Object3DEvent):void
		{
			var target : ObjectContainer3D = event.currentTarget as ObjectContainer3D;
			var parent : ObjectContainer3D = target.parent;
			
//			Check if parent exists and if it is on scene
			if ((parent != null) && (parent.scene != null))
				init();
			else
				kill();
		}*/
		
		public function init():void
		{
			_mesh.addEventListener(MouseEvent3D.MOUSE_DOWN, onMouseDown);
			changeColor();
		}
		
		public function kill():void
		{
			_mesh.removeEventListener(MouseEvent3D.MOUSE_DOWN, onMouseDown);
		}
		
		private function onMouseDown(event:MouseEvent3D):void
		{
			dispatchEvent(new SampleViewEvent(SampleViewEvent.VIEW_TRIGGERED));
		}
		
		
		public function changeColor():void {
			_material.color = Math.random() * 0xFFFFFF;
		}

	}
}