package {
	import flash.display.Sprite;

	public class Model3D extends Sprite {
		private var wall1: Sprite;
		private var wall2: Sprite;
		private var wall3: Sprite;
		private var floor: Sprite;
		private var ceiling: Sprite;

		// Origin of location
		private var originX: int = -250;
		private var originY: int = -250;

		public function Model3D() {
			// Create floor
			floor = new Sprite();
			floor.graphics.beginFill(0x000000);
			floor.graphics.drawRect(originX, originY, 500, 500);
			floor.graphics.endFill();
			addChild(floor);
			
			// Create ceiling
			ceiling = new Sprite();
			ceiling.graphics.beginFill(0x000000);
			ceiling.graphics.drawRect(originX, originY, 100, 100);
			ceiling.graphics.endFill();
			addChild(ceiling);
			
			ceiling.z -= 60;
			ceiling.x += 100;
			ceiling.y += 100;

			// Create wall 1
			wall1 = new Sprite();
			wall1.graphics.beginFill(0xff0000);
			wall1.graphics.drawRect(0, 0, 60, 100);
			wall1.graphics.endFill();
			addChild(wall1);

			wall1.rotationY = 90;
			wall1.x = originX + 100;
			wall1.y = originY + 100;
			
			// Create wall 2
			wall2 = new Sprite();
			wall2.graphics.beginFill(0x0000FF);
			wall2.graphics.drawRect(0, 0, 60, 100);
			wall2.graphics.endFill();
			addChild(wall2);
			
			wall2.rotationY = 90;
			wall2.rotationX = 90;
			wall2.x = originX + 100;
			wall2.y = originY + 100;
			
			// Create wall 3
			wall3 = new Sprite();
			wall3.graphics.beginFill(0x00ff00);
			wall3.graphics.drawRect(0, 0, 60, 100);
			wall3.graphics.endFill();
			addChild(wall3);
			
			wall3.rotationY = 90;
			wall3.x = originX + 200;
			wall3.y = originY + 100;
		}

	}

}