package  {
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.events.Event;
	
	public class Tank extends MovieClip{
		public var kbl:BetterKeyboardListener;
		
		private var speed:int;
		private var xVel:Number;
		private var yVel:Number;
		private var rotRate:int = 7;
		
		public var delay:int;
		public var delayMax:int;
		
		public function Tank(k:BetterKeyboardListener) {
			speed = 5
			kbl = k;
		}
		
		public function update(){
			xVel = Math.cos((this.rotation - 90) * Math.PI/180) * speed;
			yVel = Math.sin((this.rotation - 90) * Math.PI/180) * speed;
			
			if(kbl.checkKey(Keyboard.W)){
				this.x += xVel;
				this.y += yVel;
			}
			if(kbl.checkKey(Keyboard.A)){
				this.rotation -= rotRate;
			}
			if(kbl.checkKey(Keyboard.S)){
				this.x -= xVel/2;
				this.y -= yVel/2;
			}
			if(kbl.checkKey(Keyboard.D)){
				this.rotation += rotRate;
			}
		}
	}
	
}
