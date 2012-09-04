package robotlegs.bender.example.simpleaway3d
{
	import away3d.Away3D;
	import away3d.cameras.Camera3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.controllers.HoverController;
	import away3d.debug.AwayStats;
	import away3d.debug.Trident;
	
	import robotlegs.bender.example.simpleaway3d.config.Config;
	import robotlegs.bender.example.simpleaway3d.views.SampleView;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import robotlegs.extensions.away3dViewMap.Away3DViewMapExtension;
	
	public class RADemo extends Sprite
	{
		private var _view:View3D;
		private var _camera:Camera3D;
		private var _scene:Scene3D;
		private var context:IContext;
		private var _cameraController:HoverController;
		private var _stats:AwayStats;
		private var _trident:Trident;
		
		public function RADemo()
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			init();
		}
		
		private function init():void
		{
//			Setup Scene
			_scene = new Scene3D();
			
//			Setup Camera
			_camera = new Camera3D();
			_camera.z = -600;
			_camera.y = 500;
			
//			Setup view
			_view = new View3D();
			_view.camera = _camera;
			_view.scene = _scene;
			addChild(_view);
//			_view.scene.addChild(_camera);
			
			// Setup a HoverController (aka HoverCamera3D in older versions of Away3D)
			_cameraController = new HoverController(_camera, null, 150, 10, 2000);
			
			// Show Away3D stats
			_stats = new AwayStats(_view,true);
			_stats.x = 5;
			_stats.y = 5;
			this.addChild(_stats);
			
			_trident = new Trident();
			_trident.mouseEnabled = false;
			_view.scene.addChild(_trident);
			
			context = new Context().extend(MVCSBundle, Away3DViewMapExtension).configure(Config, this, _view);
			
			onResize();
			
			stage.addEventListener( Event.RESIZE, onResize, false, 0, true );
			stage.addEventListener( Event.ENTER_FRAME, onEnterFrame, false, 0, true );
		}
		
		private function onResize( event:Event = null ):void
		{
			_view.width = stage.stageWidth;
			_view.height = stage.stageHeight;
		}
		
		private function onEnterFrame( event:Event ):void
		{
			_view.render();
		}
	}
}