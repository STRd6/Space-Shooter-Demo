Enemy = (I={}) ->
  Object.reverseMerge I,
    xVelocity: 0
    yVelocity: 4
    x: rand(480)
    y: 0
    sprite: "enemy"
    width: 8
    height: 8

  self = GameObject(I).extend
    explode: ->
      I.active = false

      engine.add
        class: "Explosion"
        x: I.x
        y: I.y

  self.bind 'update', ->
    I.xVelocity = 4 * Math.sin(I.age/20)

    I.x += I.xVelocity
    I.y += I.yVelocity

    engine.find("Bullet").each (bullet) ->
      if Collision.rectangular(self.bounds(), bullet.bounds())
        self.explode()

    if I.y > 320
      I.active = false

  return self

