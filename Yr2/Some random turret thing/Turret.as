package  {
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	public class Turret extends MovieClip{
		
		public function Turret() {
			
		}
		
		public function pointTowards(yPos:Number, xPos:Number){
			this.rotation = (Math.atan2((yPos - this.y), (xPos - this.x)) * 180/Math.PI) + 90;
		}
	}
	
}