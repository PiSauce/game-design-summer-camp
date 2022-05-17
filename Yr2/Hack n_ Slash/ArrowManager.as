package  {
	import flash.display.MovieClip;
	
	public class ArrowManager{
		private var arrowList:Array;
		private var main:Main;
		private var target:MovieClip;

		public function ArrowManager(main:Main) {
			this.main = main;
			arrowList = [];
		}
		
		public function createArrow(pos:MovieClip, target:MovieClip, speed, duration){
			var a: Arrow = new Arrow(pos, target, speed, duration);
			main.addChild(a);
			arrowList.push(a);
			this.target = target;
		}
		
		public function update(){
			for (var i = 0; i < arrowList.length; i++) {
				var a:Arrow = arrowList[i];
				a.update();
				if(a.getDuration()){
					main.removeChild(a);
					arrowList.removeAt(i);
				}
				if(a.hitTarget()){
					main.removeChild(a);
					arrowList.removeAt(i);
				}
			}
		}
		
		public function removeAll(){
			for (var i = 0; i < arrowList.length; i++) {
				var a:Arrow = arrowList[i];
				main.removeChild(a);
			}
		}

	}
	
}
