import Base: IndexStyle, size, getindex

Buffer{T} = NTuple{N,T} where N

struct IArray{T,N} <: AbstractArray{T,N}
  size::NTuple{N,Int}
  data::Buffer{T}
end

IArray(xs::AbstractArray) = IArray{eltype(xs),ndims(xs)}(size(xs), (xs...,))

IndexStyle(xs::IArray) = IndexLinear()

size(xs::IArray) = xs.size
getindex(xs::IArray, i::Integer) = xs.data[i]
getindex(xs::IArray, i::CartesianIndex) =
