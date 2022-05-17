package {
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;

	public class Ball extends Sprite {
		private var r: Number;
		private var c: uint;

		public var xVel: Number;
		public var yVel: Number;

		public var beingDragged: Boolean = false;

		// public var aX:Number = 0; // Accelerometer X variable
		// public var aY:Number = 0; // Accelerometer Y variable

		public function Ball(radius: Number, color: uint) {
			// Init variables
			this.r = radius;
			this.c = color;
			this.xVel = 0;
			this.yVel = 0;

			// Draw ball
			this.graphics.beginFill(this.c);
			this.graphics.drawCircle(0, 0, this.r);
			this.graphics.endFill();
		}

		public function update() { // Called by Main to update the ball
			move();
		}

		private function move() { // Moves the ball
			// Init variables
			var w = this.width / 2;
			var h = this.height / 2;

			// Move the ball
			this.x += xVel;
			this.y += yVel;

			// Update the velocity
			if (!beingDragged) {
				xVel *= 0.99;
				yVel += 2;
			}

			// Bounces the ball on the walls
			if (this.x + w > stage.stageWidth || this.x - w < 0) {
				xVel *= -0.8;
			}
			if (this.y + h > stage.stageHeight || this.y - h < 0) {
				yVel *= -0.8;
			}

			// Keep the ball within boundaries
			while (this.x + w > stage.stageWidth) {
				this.x--;
			}
			while (this.x - w < 0) {
				this.x++;
			}
			while (this.y + h > stage.stageHeight) {
				this.y--;
			}
			while (this.y - h < 0) {
				this.y++;
			}
		}

	}

}