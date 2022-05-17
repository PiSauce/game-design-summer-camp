package  {
	import flash.display.Sprite;
	
	public class Goal extends Sprite{

		public function Goal() {
			// constructor code
		}
		
		public function removeGoal(){
			while(this.numChildren > 0){
				this.removeChildAt(0);
			}
		}

	}
	
}
