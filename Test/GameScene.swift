//
//  GameScene.swift
//  Test
//
//  Created by Kai Drayton-Yee on 7/18/16.
//  Copyright (c) 2016 Kai Drayton-Yee. All rights reserved.
//

import SpriteKit

 //class Button: SKSpriteNode{
	// var buttonColor: UIColor
	//public var buttonSize: CGSize
	
	//init(buttonColor: UIColor, buttonSize: CGSize) {
	//	self.buttonColor = buttonColor
	//	self.buttonSize = buttonSize
	//}
	//required public init?(coder aDecoder: NSCoder) {
	//	fatalError("init(coder:) has not been implemented")
	//}
	//override func createButton(){
	//}
	//let test = Button(buttonColor: UIColor.blackColor(), buttonSize: CGSize(width: 100, height: 35))
	
//}





class GameScene: SKScene {
	
	
	
	var box: SKSpriteNode!
	var spinMe: SKSpriteNode!
	var button: SKSpriteNode!
	var counter = 0
	var boxIsSpinning = true
	var spinMeIsSpinning = true
	
	var rotateForever: SKAction! = nil
	var rotateSpinMeForever: SKAction!

	
	override func didMoveToView(view: SKView) {
		/* Setup your scene here */
		

		
		//let blue = UIColor(hue: 0.3, saturation: 1.0, brightness: 1.0, alpha: 1.0)
		//let yellow = UIColor.yellowColor()
		
		
		let rotate = SKAction.rotateByAngle(CGFloat(M_PI) * 2, duration: 6)
		rotateForever = SKAction.repeatActionForever(rotate)
		let rotateSpinMe = SKAction.rotateByAngle(CGFloat(M_PI) * 2, duration: 4)
		rotateSpinMeForever = SKAction.repeatActionForever(rotateSpinMe)
		let swiftColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
		
		box = SKSpriteNode(color: swiftColor, size: CGSize(width: 200, height: 200))
		addChild(box)
		box.position.x = view.frame.width / 2
		box.position.y =  view.frame.height / 2
		box.runAction(rotateForever)
		
		spinMe = SKSpriteNode(texture: SKTexture(imageNamed:"blueRingCircleTest"), color: UIColor.blueColor(), size: CGSize(width: 400, height: 400))
		addChild(spinMe)
		spinMe.position.x = view.frame.width / 2
		spinMe.position.y = view.frame.height / 2
		spinMe.runAction(rotateSpinMeForever)
		print("both the box and the spinMe have started moving")
		
		
		//button = SKSpriteNode(color: UIColor.yellowColor(), size: CGSize(width: 100, height: 35))
		//button.position.x = view.frame.width / 5
		//button.position.y = view.frame.height / 12
		//addChild(button)
		
	//	test.position.x = view.frame.width / 5
	//	test.position.y = view.frame.height / 12
	//	addChild(test)
	//	print("testButton is created")
		
	}
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		/* Called when a touch begins */
		
		if  counter < 1 && counter >= 0 {
			//box.runAction(makeReappear)
			box.removeAllActions()
			counter += 1
			boxIsSpinning = false
			print("the box has stopped moving and the counter's count is \(counter)")
		}else if counter < 2 && counter >= 1 {
			spinMe.removeAllActions()
			counter += 1
			spinMeIsSpinning = false
			print("the spinMe has stopped moving and the counter's count is \(counter)")
		}else if counter < 3 &&  counter >= 2 && spinMeIsSpinning == false && boxIsSpinning == false{
			
			counter = 0
			
			box.runAction(rotateForever)
			
			spinMe.runAction(rotateSpinMeForever)
			
			print("both the box and the spinMe have started moving again and the counter's count is \(counter)")
			
			//box.hidden = true
		}
	}
	
	override func update(currentTime: CFTimeInterval) {
		/* Called before each frame is rendered */
		
	}
}