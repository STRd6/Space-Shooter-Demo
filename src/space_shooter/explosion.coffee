Explosion = (I={}) ->
  frames = [
    Sprite.fromPixieId 8647
    Sprite.fromPixieId 8649
    Sprite.fromPixieId 8650
  ]

  Object.reverseMerge I,
    yVelocity: 4
    sprite: "enemy"

  self = GameObject(I)

  self.bind 'update', ->
    I.y += I.yVelocity

    I.sprite = frames[(I.age / 6).floor()]

    I.active = false unless I.sprite

  self.bind 'create', ->
    Sound.play "explosion"

  return self

