package  {
	import flash.display.MovieClip;
	
	public class Enemy extends MovieClip{
		private var type:String;
		private var spd:int;
		private var tick:int;
		public var end:Boolean;
		public var hit:Boolean;

		public function Enemy(type:String, startX:Number, startY:Number, spd:int) {
			this.type = type;
			this.x = startX;
			this.y = startY;
			this.spd = spd;
			end = false;
			hit = false;
			tick = 0;
		}
		
		public function update(){
			move();
			tick++;
		}
		
		private function move(){
			var w = this.width/2;
			var h = this.height/2;
			switch (type){
				case "LINE":
					this.x += spd;
					if(spd > 0){// Moving right
						end = this.x - w > stage.stageWidth;
					} else if (spd < 0){
						end = this.x + w < 0;
					}
					break;
				case "SIN":
					this.x += spd;
					this.y += Math.sin(tick / 5) * spd;
					break;
				case "COS":
					this.x += spd;
					this.y += Math.cos(
			}
		}

	}
	
}
