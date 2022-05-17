package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Main extends MovieClip{
		public var turret:Turret;
		private var mDown:Boolean;
		private var bulletDelay:int;
		private var maxBulletDelay:int;
		private var bulletList:Array = [];

		public function Main() {
			turret = new Turret;
			turret.x = 275;
			turret.y = 200;
			addChild(turret);
			
			bulletDelay = 6;
			maxBulletDelay = 6;
			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		
		public function update(e:Event){
			turret.pointTowards(mouseY, mouseX);
			
			bulletDelay++;
			if(mDown && bulletDelay > maxBulletDelay){
				shoot();
				bulletDelay = 0;
			}
			if(bulletList.length > 0)
            {
                for(var i = 0; i < bulletList.length; i++){
                    bulletList[i].update();
                }
            }
		}
		
		public function mouseDown(e:MouseEvent){
			mDown = true;
		}
		
		public function mouseUp(e:MouseEvent){
			mDown = false;
		}
		
		public function shoot(){
			var bullet:Bullet = new Bullet(turret.x, turret.y, turret.rotation, 550, 400);
            bullet.addEventListener(Event.REMOVED_FROM_STAGE, bulletRemoved, false, 0, true);
            bulletList.push(bullet);
            addChild(bullet);
		}
		
		public function bulletRemoved(e:Event){
            e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, bulletRemoved);
            bulletList.splice(bulletList.indexOf(e.currentTarget),1);
        }

	}
	
}
