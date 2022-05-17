package {
	import flash.display.Sprite;
	import flash.geom.Vector3D;
	import flash.events.Event;
	import flash.ui.Keyboard;

	public class Scene extends Sprite {
		private var model: Model3D;
		private var point: Vector3D;
		private var key: KeyboardListener;
		
		private var speed:int;

		public function Scene() {
			// Init variables
			key = new KeyboardListener(stage);
			speed = 5;

			// Creating a new 3D model
			model = new Model3D();
			model.x = 300;
			model.y = 220;
			model.z = -200;
			model.rotationX = -90;
			addChild(model);

			point = new Vector3D(model.x, model.y, model.z - 300);

			addEventListener(Event.ENTER_FRAME, enterFrame);
		}

		public function enterFrame(e: Event) {
			move();
		}
		
		public function move(){
			if(key.checkKey(Keyboard.W)) model.z -= speed;
			if(key.checkKey(Keyboard.A)) model.x += speed;
			if(key.checkKey(Keyboard.S)) model.z += speed;
			if(key.checkKey(Keyboard.D)) model.x -= speed;
			if(key.checkKey(Keyboard.UP)) model.y += speed;
			if(key.checkKey(Keyboard.DOWN)) model.y -= speed;
			if(key.checkKey(Keyboard.LEFT)) model.transform.matrix3D.appendRotation(3, Vector3D.Y_AXIS, point);
			if(key.checkKey(Keyboard.RIGHT)) model.transform.matrix3D.appendRotation(-3, Vector3D.Y_AXIS, point);
		}

	}

}