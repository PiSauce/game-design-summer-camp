package  {
	import flash.display.MovieClip;
	
	public class BulletManager {
		private var bulletList:Array;
		private var main:Main;

		public function BulletManager(main:Main) {
			this.main = main;
			bulletList = [];
		}
		
		public function createBullet(pos:MovieClip, speed:int, duration:int){
			var b:Bullet = new Bullet(pos, speed, duration);
			main.addChild(b);
			bulletList.push(b);
		}
		
		public function update(){
			for(var i = 0; i < bulletList.length; i++){
				var b:Bullet = bulletList[i];
				b.update();
				if(b.getDuration()){
					main.removeChild(b)
					bulletList.removeAt(i);
				}
			}
		}
		
		public function removeAll(){
			while(bulletList.length > 0){
				bulletList.pop();
			}
		}

	}
	
}
