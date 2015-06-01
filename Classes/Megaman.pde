public class Megaman implements Killable {
  int HP, buster, panelRow, panelCol, currentAnimation, invinsibleTimer;
  String cross;

  Animation Standing = new Animation("../Sprites/megaman/noCross/01", 1);
  Animation Hurt = new Animation("../Sprites/megaman/noCross/02", 8);
  Animation ArrivePanel = new Animation("../Sprites/megaman/noCross/03", 4);
  Animation LeavePanel = new Animation("../Sprites/megaman/noCross/04", 4);
  Animation Buster = new Animation("../Sprites/megaman/noCross/15", 5);
  Animation Bullet = new Animation("../Sprites/megaman/noCross/16", 3);
  Animation ChargeBlue = new Animation("../Sprites/chargingBuster/01", 7);
  Animation ChargePurp = new Animation("../Sprites/chargingBuster/02", 11);

  
  //Swords
  Animation Sword = new Animation("../Sprites/battleChipAttack/slash/00", 7, 1);
  Animation WideSword = new Animation("../Sprites/battleChipAttack/slash/04", 7, 1);
  Animation LongSword = new Animation("../Sprites/battleChipAttack/slash/01", 10, 1);
  Animation LifeSword = new Animation("../Sprites/battleChipAttack/slash/03", 10, 1);
  //Cannon
  Animation Cannon = new Animation("../Sprites/battleChipAttack/cannon/00", 10, 1);
  Animation Blast = new Animation("../Sprites/battleChipAttack/cannon/01", 4, 1);
  //Spreader
  Animation Spreader = new Animation("../Sprites/megaman/noCross/07", 8);
  //Bombs
  Animation Throw = new Animation("../Sprites/megaman/noCross/06", 6, 2);
  

  public Megaman() {
    this(100, 1, 1, 1, "noCross");
  }
  public Megaman(int HP, int buster, int panelRow, int panelCol, String cross) {
    this.HP=HP;
    this.buster=buster;
    this.cross=cross;
    this.panelRow = panelRow;
    this.panelCol = panelCol;
  }

  public void draw() {
  }

  public void display(float xpos, float ypos, int animation, int mode) {
    if (mode == 0) {
      if (animation == 0) {
        //for (int i = 0; i < Standing.spriteCount; i++){
        Standing.display(xpos, ypos,invinsibleTimer);
        //}
      }
      if (animation == 1) {
        //for (int i = 0; i < Hurt.spriteCount; i++){
        Hurt.display(xpos, ypos,invinsibleTimer);
        //}
      }
      if (animation == 2) {
        //for (int i = 0; i < ArrivePanel.spriteCount; i++){
        ArrivePanel.display(xpos, ypos,invinsibleTimer);
        //}
      }
      if (animation == 3) {
        //for (int i = 0; i < LeavePanel.spriteCount; i++){
        LeavePanel.display(xpos, ypos,invinsibleTimer);
        //}
      }
      if (animation == 4){
        Buster.display(xpos, ypos, invinsibleTimer);
        if (Buster.currentFrame > 1){
          if (Buster.currentFrame == 4){
            Bullet.displayChips(xpos+70, ypos-48);
          } else {
            Bullet.displayChips(xpos+70, ypos-39);
          }
        }
      }
    }
    if (mode == 1) {
      println(mode);
      if (animation == 0) {
        if (Standing.currentFrame == 0){
          image(Standing.spriteFrames[Standing.currentFrame], xpos, ypos - Standing.spriteFrames[Standing.currentFrame].height + 5);
        }
      }
      if (animation == 1) {
        image(Hurt.spriteFrames[Hurt.currentFrame], xpos, ypos - Hurt.spriteFrames[Hurt.currentFrame].height + 5);
      }
      if (animation == 2) {
        image(ArrivePanel.spriteFrames[ArrivePanel.currentFrame], xpos, ypos - ArrivePanel.spriteFrames[ArrivePanel.currentFrame].height + 5);
      }
      if (animation == 3) {
        image(LeavePanel.spriteFrames[LeavePanel.currentFrame], xpos, ypos - LeavePanel.spriteFrames[LeavePanel.currentFrame].height + 5);
      }
      if (animation == 4) {
        image(Buster.spriteFrames[LeavePanel.currentFrame], xpos, ypos - Buster.spriteFrames[Buster.currentFrame].height + 5);
        if (Buster.currentFrame > 1){
          image(Bullet.spriteFrames[LeavePanel.currentFrame], xpos+70, ypos-39 - Bullet.spriteFrames[Bullet.currentFrame].height + 5);
        }
      }
    }
    currentAnimation = animation;
  }
  
  public void display(float xpos, float ypos, int animation, int mode, int frame){
    if (mode == 0 ){
      if (animation == 98){
       ChargeBlue.displayF(xpos-19, ypos+15, frame); 
      }
      if (animation == 99){
       ChargePurp.displayF(xpos-19, ypos+15, frame); 
      }
    }
    if (mode == 1){
      if (animation == 98){
        image(ChargeBlue.spriteFrames[ChargeBlue.currentFrame], xpos-19, ypos+15 - ChargeBlue.spriteFrames[ChargeBlue.currentFrame].height + 5);
      }
      if (animation == 99){
        image(ChargePurp.spriteFrames[ChargePurp.currentFrame], xpos-19, ypos+15 - ChargePurp.spriteFrames[ChargePurp.currentFrame].height + 5);
      }
    }
  }
  
  public void display(float xpos, float ypos, int mode, String chip){
    if (mode == 0){
      if (chip.equals("sword")){
       Sword.display(xpos-7, ypos+4, invinsibleTimer); 
      }
      if (chip.equals("widesword")){
       WideSword.display(xpos-17, ypos+36, invinsibleTimer); 
      }
      if (chip.equals("longsword")){
       LongSword.display(xpos-11, ypos+12, invinsibleTimer); 
      }
      if (chip.equals("lifesword")){
       LifeSword.display(xpos-6, ypos+40, invinsibleTimer); 
      }
      if (chip.equals("cannon")){
       Cannon.display(xpos, ypos,invinsibleTimer);
       if (Cannon.currentFrame == 4 || Cannon.currentFrame == 5){
        Blast.displayChips(xpos+85, ypos-27);
       } else if (Cannon.currentFrame == 6){
        Blast.displayChips(xpos+85, ypos-10);
       } else if (Cannon.currentFrame == 7){
        Blast.displayChips(xpos+85, ypos-15);
       }
      }
      if (chip.equals("spreader")){
       Spreader.display(xpos,ypos,invinsibleTimer); 
      }
      if (chip.equals("bomb")){
       Throw.display(xpos,ypos,invinsibleTimer); 
      }
    }
  }
  
  public void getHurt(Panel[][] Grid){
    if (Grid[panelRow][panelCol].isDangerMM() && invinsibleTimer == 0){
      hurt(Grid[panelRow][panelCol].getDamage());
      invinsibleTimer = 90;
    }
    else if (invinsibleTimer > 0){
      invinsibleTimer -= 1;
    }
  }

  public void hurt(int dmg) {
    HP-=dmg;
  }
  public void heal(int regen) {
    HP+=regen;
  }
  public int getHP() {
    return HP;
  }
  public int getRow() {
    return panelRow;
  } 
  public int getCol() {
    return panelCol;
  }
  public void setRow(int Row) {
    panelRow = Row;
  }
  public void setCol(int Col) {
    panelCol = Col;
  }
  public int getBuster(){
   return buster; 
  }
  public void setBuster(int val){
   buster = val;
  }
}

