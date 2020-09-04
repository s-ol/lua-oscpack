describe("oscpack", function ()
  local osc = require 'oscpack'

  local function testValue(value)
    local url, val = osc.unpack(osc.pack('/some/url', value))
    assert.is.same('/some/url', url)
    assert.is.same(value, val)
  end

  it("should pack/unpack booleans", function ()
    testValue(true)
    testValue(false)
  end)

  it("should pack/unpack numbers", function ()
    testValue(1.25)
    testValue(-1000)
  end)

  it("should pack/unpack strings", function ()
    testValue 'holly dog'
  end)

  it("should pack/unpack arrays", function ()
    testValue {-2.5, 3.5, 'hello'}
  end)

  it("should pack/unpack nested arrays", function ()
    testValue {1, {4, 5}, 6}
  end)

  it("should pack/unpack hashes", function ()
    testValue {speed = -2.25, accel = 3.5, name = 'hello'}
  end)

  it("should pack/unpack nested hashes", function ()
    testValue {
      speed = -2.5, accel = 3.5, name = 'hello',
      sub = {
        lazy = 'dog',
      },
    }
  end)

  it(":pack() should return strings", function ()
    local data = osc.pack('/foo/bar', 1, 2, 'hello')
    assert.is.same('string', type(data))
  end)
end)
