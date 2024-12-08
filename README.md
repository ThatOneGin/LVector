# LVector

Simple 2D vector library for lua made in lua.

**If any bugs were found, open an issue or pull request here.**

## Installation

Copy ```lvector.lua``` into your project and import it.

```lua
local lvector = require("lvector")
```

## Functions

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

---Unpack the vector in x, y.
function vector:unpack()

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