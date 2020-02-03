# IArrays

This is a prototype/proposal for more structured mutable array semantics in Julia,
which is more easily compatible with AD and other program transformations.

`IArray`s can largely be used as normal arrays, except that they are immutable.

```julia
julia> xs = IArray(rand(3, 3))
3×3 IArray{Float64,2}:
 0.59274   0.76084   0.605007
 0.353013  0.773034  0.325377
 0.642339  0.237374  0.421283

julia> xs*xs
3×3 Array{Float64,2}:
 1.00855   1.18275   0.86105
 0.691138  0.943404  0.602178
 0.735142  0.772217  0.643335
```

Limitations:
* Likely needs some (reasonably simple) compiler support to be remotely efficient.
  * i.e. immutable heap-allocated buffers + escape analysis
* No GPU support yet
  * i.e. immutable heap-allocated GPU buffers
