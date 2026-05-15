wf = require "windfield"

function love.load()
    world = wf.newWorld(0, 500)

    ball = world:newCircleCollider(100, 100, 20)
    ball:setRestitution(0.8)
    ball:setLinearVelocity(150, 0)

    ground = world:newRectangleCollider(0, 550, 800, 50)
    ground:setType("static")

    time = 0
    sampleTimer = 0
    sampleInterval = 0.1

    data = {}
    table.insert(data, "time,y")
end

function love.update(dt)
    world:update(dt)

    time = time + dt
    sampleTimer = sampleTimer + dt

    if sampleTimer >= sampleInterval then
        local x, y = ball:getPosition()
        table.insert(data, string.format("%.2f,%.2f", time, y))
        sampleTimer = 0
    end

    if time >= 5 then
        saveData()
        love.event.quit()
    end
end

function love.draw()
    world:draw()

    love.graphics.print("Recording motion data...", 20, 20)
    love.graphics.print("Time: " .. string.format("%.2f", time), 20, 40)
end

function saveData()
    local csv = table.concat(data, "\n")
    love.filesystem.write("motion_data.csv", csv)
end
