local vector = require "vector"

describe("vector", function()
    describe("new vector", function()
		it("sets the vector",
		function()
			local x, y = 1, 2
			local vec = vector(x, y)
		 	assert.is_equal(x, vec.x)
			assert.is_equal(y, vec.y)
			assert.is_equal(vec, vector(x, y))
			assert.is_equal(vector.UP, vector(0,-1))
			assert.is_equal(vector.DOWN, vector(0,1))
			assert.is_equal(vector.LEFT, vector(-1,0))
			assert.is_equal(vector.RIGHT, vector(1,0))
			assert.is_equal(vector.ZERO, vector(0,0))
			assert.is_equal(vector.ONE, vector(1,1))
			assert.is_equal(vec.x + vec.y, x+y)
		end)
		it("test functions", function()
			local vec = vector()
			assert.is_equal(type(vec:string()), "string")
			assert.is_equal(vec:angle(), 0)
			vec:normalized()
			assert.is_equal(vec.x + vec.y, 0)
			assert.is_equal(vec:distanceSquaredTo(vector.ONE), 2)
			assert.is_equal(vec:distanceTo(vector.RIGHT), 1)
			assert.is_equal(vec:distanceSquared(), 0)
			assert.is_equal(vec:distance(), 0)
			assert.is_equal(vec:dot(vector.LEFT), 0)
			assert.is_equal(vec:perpDot(vector.UP), 0)
			vec.x, vec.y = -1,-1
			vec:abs()
			assert.is_equal(vec.x + vec.y, 2)
			vec.x, vec.y = 0.55, 0.45
			vec:round()
			assert.is_equal(vec.x + vec.y, 1)
			vec:toPolar(0)
			assert.is_equal(vec.x + vec.y, 1)
			vec:rotated(math.pi)
			assert.is_equal(vec.x + vec.y, -1)
			assert.is_equal(vec:cross(vector.ZERO), 0)
			vec.x, vec.y = 1, 2
			assert.is_equal(vec:perpendicular(), vector(-2,1))
			vec:lerpTo(vec, 1)
			assert.is_equal(vec, vector(-2, 1))
			local x, y = vec:unpack()
			assert.is_equal(x + y, -1)
		end)
	end)
end)

