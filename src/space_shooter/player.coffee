# The player's spaceship. It flies around and shoots.

Player = (I={}) ->
  Object.reverseMerge I,
    speed: 4
    x: 240
    y: 300
    shootCooldown: 0
    sprite: Sprite.loadByName "player"

  self = GameObject(I).extend
    shoot: ->
      I.shootCooldown += 8

      engine.add
        class: "Bullet"
        x: I.x

  self.bind 'update', ->
    I.shootCooldown = I.shootCooldown.approach(0, 1)

    if keydown.left
      I.x -= 4
    if keydown.right
      I.x += 4

    if !I.shootCooldown and keydown.space
      self.shoot()

    I.x = I.x.clamp(8, 480 - 8)

    log I.x

  return self

