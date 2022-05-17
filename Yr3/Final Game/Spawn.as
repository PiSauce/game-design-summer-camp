package  {
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Spawn extends Sprite{

		public function Spawn() {
			respawn();
		}
		
		public function respawn(){
			this.alpha = 1;
			this.addEventListener(Event.ENTER_FRAME, disappear);
		}
		
		public function removeSpawn(){
			while(this.numChildren > 0){
				this.removeChildAt(0);
			}
		}
		
		private function disappear(e:Event){
			this.alpha -= 0.05;
			if(this.alpha <= 0){
				this.removeEventListener(Event.ENTER_FRAME, disappear);
			}
		}

	}
	
}
