// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//trying to understand 4-bit binary. Oh, and remember this article: http://assoc.tumblr.com/post/47367620791/german-soldiers-and-unix-worse-is-better



var a = 0
var b = 0
var c = 0
var d = 0

func fourBit() -> Int {
    var result = (a * 1000) + (b * 100) + (c * 10) + (d)
    return result
}




func convertBinary() -> Int {
    var result = (a * 8) + (b * 4) + (c * 2) + (d)
    return result
}

fourBit()
convertBinary()

d = 1

fourBit()
convertBinary()

a = 1
d = 1

fourBit()
convertBinary()

b = 1
c = 1

fourBit()
convertBinary()















//type Sprite struct {
//    image Image
//    position Point
//}
//
//func (sprite *Sprite) draw() {
//    var screen Screen = graphics.SharedScreen()
//    screen.drawImage(sprite.image, sprite.position)
//}
//
////func (sprite Sprite) draw(screen Screen) {
////    screen.drawImage(sprite.image, sprite.position)
////}
////
////func gameloop() {
////    screen = graphics.SharedScreen()
////    var player Sprite = getPlayer()
////    player.draw(screen)
////}
//
//type Sprite struct {
//    screen Screen
//    image Image
//    position Point
//}
//
//func (sprite *Sprite) draw() {
//    var screen Screen = sprite.screen
//    screen.drawImage(sprite.image, sprite.position)
//}
//
//var mockScreen *MockScreen
//
//func TestSpriteDrawing(t *testing.T) {
//    var sprite Sprite = createTestSprite()
//    sprite.screen = mockScreen
//    sprite.draw()
//}