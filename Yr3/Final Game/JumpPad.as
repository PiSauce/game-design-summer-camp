package  {
	import flash.display.Sprite;
	
	public class JumpPad extends Sprite{

		public function JumpPad() {
			// constructor code
		}
		
		public function removeJump() {
			while(this.numChildren > 0){
				this.removeChildAt(0);
			}
		}


	}
	
}
