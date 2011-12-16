Bullet = (I={}) ->
  BULLET_SPRITES = [Sprite.loadByName("bullet-small"), Sprite.loadByName("bullet-large")]

  Object.reverseMerge I,
    sprite: BULLET_SPRITES.rand()
    y: 320
    velocity: Point(0, -10)
    width: 3
    height: 3

  self = GameObject(I)

  self.bind 'update', ->
    I.y += I.velocity.y

    if I.y < 0
      I.active = false

  self.bind 'create', ->
    Sound.play "pew"

  return self

