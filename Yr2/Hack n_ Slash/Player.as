package {
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	import flash.display3D.IndexBuffer3D;

	public class Player extends MovieClip {
		private var bkl: BetterKeyboardListener;
		private var speed: int;
		private var rotationSpeed: int;
		private var curState: String;
		private var hud: Hud;
		private var curHealth: int;
		private var totalHealth: int;
		private var hit: Boolean;
		private var main: Main;
		private var lmb: Boolean;
		private var rmb: Boolean;
		private var tick: int;
		private var cooldown1: int;
		private var cooldown2: int;
		private var delay1: int;
		private var delay2: int;
		public var skillPoints: int;
		
		private var attack1Dmg: int; // Left click
		private var attack2Dmg: int; // Right click
		private var attack3Dmg: int; // Spacebar
		
		private var upgrade1Req: int;
		private var upgrade2Req: int;
		private var upgrade3Req: int;

		public function Player(bkl: BetterKeyboardListener, hud: Hud, health: int, main: Main) {
			this.main = main;
			this.bkl = bkl;
			this.hud = hud;
			totalHealth = health;
			curHealth = health;
			hit = false;
			lmb = false;
			rmb = false;
			speed = 10;
			rotationSpeed = 15;
			delay1 = 24;
			delay2 = 48;
			skillPoints = 0;
			
			attack1Dmg = 5;
			attack2Dmg = 20;
			attack3Dmg = 10;
			
			upgrade1Req = 1;
			upgrade2Req = 1;
			upgrade3Req = 1;

			this.gotoAndStop("IDLE");
			curState = "IDLE";

			main.stage.addEventListener(MouseEvent.MOUSE_DOWN, lmbDown);
			main.stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, rmbDown);

		}

		// Updates the player each frame
		public function update() {
			pointToMouse();
			move();
			toAttack();
			updateState();
			updateHealth();
			updateCooldown();
			upgradeSkills();

			if(!GameState.pauseTick) tick++;
			if(upgrade1Req <= skillPoints){
				hud.upgrade1.alpha = 1;
			} else {
				hud.upgrade1.alpha = 0;
			}
			if(upgrade2Req <= skillPoints){
				hud.upgrade2.alpha = 1;
			} else {
				hud.upgrade2.alpha = 0;
			}
			if(upgrade3Req <= skillPoints){
				hud.upgrade3.alpha = 1;
			} else {
				hud.upgrade3.alpha = 0;
			}
		}
		
		private function upgradeSkills(){
			if(bkl.checkKey(Keyboard.Z) && upgrade1Req <= skillPoints) upgrade1();
			if(bkl.checkKey(Keyboard.X) && upgrade2Req <= skillPoints) upgrade2();
			if(bkl.checkKey(Keyboard.C) && upgrade3Req <= skillPoints) upgrade3();
		}

		public function updateHealth() {
			var healthLeft: int = Math.floor(curHealth / totalHealth * 100);
			if(healthLeft <= 0) {
				hud.healthBar.gotoAndStop(0);
			} else {
				hud.healthBar.gotoAndStop(healthLeft);
			}
		}

		private function updateCooldown() {
			var CD1: int = Math.floor((tick - cooldown1) / delay1 * 100);
			var CD2: int = Math.floor((tick - cooldown2) / delay2 * 100);
			if(CD1 <= 0) {
				hud.cooldown1.gotoAndStop(0);
			} else {
				hud.cooldown1.gotoAndStop(CD1);
			}
			if(CD1 <= 0) {
				hud.cooldown2.gotoAndStop(0);
			} else {
				hud.cooldown2.gotoAndStop(CD2);
			}
		}

		private function toAttack() {
			if(bkl.checkKey(Keyboard.SPACE) && cooldown1 + delay1 <= tick) {
				curState = "ATTACK3";
				this.gotoAndStop(curState);
				cooldown1 = tick;
			}
		}

		public function attackedBy(e: Enemy) {
			var enemyState: String = e.getState();
			if(enemyState == "ATTACK") {
				var hitbox: HitBox = e.attack.hitBox;
				if(hit == false && hitbox != null && this.hurtBox.hitTestObject(hitbox)) {
					curHealth -= hitbox.getDmg();
					e.setHitPlayer(true);
				}
			}
		}

		private function updateState() {
			var hitBox: HitBox;
			switch(curState) {
				case "ATTACK1":
					this.gotoAndStop(currentFrame);
					hitBox = this.attack1.hitBox;
					if(hitBox != null) {
						hitBox.setDmg(attack1Dmg);
					}
					if(this.attack1.currentFrame == this.attack1.totalFrames) {
						curState = "IDLE";
						this.gotoAndStop(curState);
					}
					break;
				case "ATTACK2":
					this.gotoAndStop(currentFrame);
					hitBox = this.attack2.hitBox;
					if(hitBox != null) {
						hitBox.setDmg(attack2Dmg);
					}
					if(this.attack2.currentFrame == this.attack2.totalFrames) {
						curState = "IDLE";
						this.gotoAndStop(curState);
					}
					break;
				case "ATTACK3":
					this.gotoAndStop(currentFrame);
					step(2);
					hitBox = this.attack3.hitBox;
					if(hitBox != null) {
						hitBox.setDmg(attack3Dmg);
					}
					if(this.attack3.currentFrame == this.attack3.totalFrames) {
						curState = "IDLE";
						this.gotoAndStop(curState);
					}
					break;
			}
		}

		// Move the player
		private function move() {
			if(curState == "IDLE") {
				if(bkl.checkKey(Keyboard.W)) this.y -= speed;
				if(bkl.checkKey(Keyboard.A)) this.x -= speed;
				if(bkl.checkKey(Keyboard.S)) this.y += speed;
				if(bkl.checkKey(Keyboard.D)) this.x += speed;

				while(this.x - this.hurtBox.width / 2 < -1065) this.x++;
				while(this.x + this.hurtBox.width / 2 > 1065) this.x--;
				while(this.y - this.hurtBox.height / 2 < -1065) this.y++;
				while(this.y + this.hurtBox.height / 2 > 1065) this.y--;
			}
		}

		private function step(multiplier: int = 1) {
			this.x += Math.cos(this.rotation * Math.PI / 180) * speed * multiplier;
			this.y += Math.sin(this.rotation * Math.PI / 180) * speed * multiplier;
		}

		// Checks for mouse states

		private function lmbDown(e: MouseEvent) {
			curState = "ATTACK1";
			gotoAndStop(curState);
		}

		private function rmbDown(e: MouseEvent) {
			if(cooldown2 + delay2 <= tick) {
				curState = "ATTACK2";
				gotoAndStop(curState);
				cooldown2 = tick;
			}
		}

		private function pointToMouse() {
			var deltaX = main.mouseX - this.x;
			var deltaY = main.mouseY - this.y;

			this.rotation = Math.atan2(deltaY, deltaX) * 180 / Math.PI;
		}

		// Public functions
		public function upgrade1() { // Left Click
			attack1Dmg += 5;
			skillPoints -= upgrade1Req;
			upgrade1Req++;
		}

		public function upgrade2() { // Right Click
			attack2Dmg += 20;
			skillPoints -= upgrade2Req;
			upgrade2Req++;
		}

		public function upgrade3() { // Spacebar
			attack3Dmg += 10;
			skillPoints -= upgrade3Req;
			upgrade3Req++;
		}
		
		public function heal() {
			curHealth += 10;
		}
		
		public function getState() {
			return curState;
		}

		public function setHit(isHit: Boolean) {
			hit = isHit;
		}

		public function isDead() {
			return(curHealth <= 0);
		}

		public function getHealth() {
			return(curHealth / totalHealth);
		}
		
		public function hitByArrow() {
			curHealth -= 10;
		}
	}

}