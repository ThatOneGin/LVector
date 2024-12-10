# Null

Null (Not Useful Lua Libraries)

**If any bugs were found, open an issue or pull request here.**

# Installation

Just copy whatever file you want in your project and import it like this:

```lua
local shapes = require("shapes")
local lvector = require("lvector")
local string_view = require("string_view")
```

# Functions

## LVector Functions

### Library functions

```lua
---Returns a new vector based on (x, y).
local function new_vector(x, y)

---Returns a vector with random values.
local function random()
```
### Vector type functions

```lua
function vector:clone()
---Clone a vector and returns it.

function vector:unpack()
---Unpack the vector in x, y.

function vector.pack(v)
---Pack the vector and returning it as a new vector.

function vector:modify(newx, newy)
---Set the values of a vector.

function vector:clamp(min, max)
---Clamp given vectors.

function vector:dot(v)
---Returns the dot product of given vector and self.

function vector:toarray()
---Returns the vector in an array format.

function vector:rotate(angle)
---Rotate the vector in `angle` degress (radians).

function vector:normalize()
---Normalize vector.
```

## String_view Functions

```lua
function String_view.new(str)

function String_view:l_str()

function String_view:len()

function String_view:hasSuffix(suffix)

function String_view:hasPrefix(prefix)

function String_view.split(str, delm)

function String_view:putch(char, idx)

function String_view:delch(idx)
```

## Shapes Functions

```lua
function shapes:shape(name, shape, ...)

function shapes:reshape(name, new_shape)

function shapes:hasField(name, field)

function shapes:get_shape(name)
```