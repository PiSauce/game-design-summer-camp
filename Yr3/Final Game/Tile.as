package  {
	import flash.display.Sprite;
	
	public class Tile extends Sprite{

		public function Tile(color:uint = 0x000000) {
			this.graphics.beginFill(color)
			this.graphics.drawRect(0, 0, 50, 50);
			this.graphics.endFill();
		}
		
		public function changeColor(color:uint){
			this.graphics.beginFill(color)
			this.graphics.drawRect(0, 0, 50, 50);
			this.graphics.endFill();
		}

	}
	
}
