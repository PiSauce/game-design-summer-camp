package  {
	import flash.display.MovieClip;
	
	public class Tile extends MovieClip{
		private var tileType:int;
		private var tileDir:String;

		public function Tile(tileType:int, tileDir:string) {
			this.tileType = tileType;
			this.tileDir = tileDir;
			
			switch(tileType){
				case 0:
					gotoAndStop("grass")
					break;
				case 1:
					gotoAndStop("tile");
					break;
				case 2:
					gotoAndStop("right");
					break;
				case 3:
					gotoAndStop("left");
					break;
				case 4:
					gotoAndStop("up");
					break;
				case 5:
					gotoAndStop("down");
					break;
				case 6:
					gotoAndStop("start");
					break;
				case 7:
					gotoAndStop("end");
					break;
			}
		}

	}
	
}
