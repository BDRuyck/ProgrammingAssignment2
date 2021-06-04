## Put comments here that give an overall description of what your
## functions do

## MakeCacheMatrix consists of set, get, setInverse and getInverse
## The function MakeCacheMatrix creates a special matrix that can cache its reverse 

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
       x <<-y
      inv <<-NULL
  }
  
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() {inv}
  list(set=set, get=get,setInverse=setInverse,getInverse=getInverse)
}

## The function cacheSolve computes the inverse of the special matrix returned 
##by the function MakeCacheMatrix above. 
## The function cacheSolve uses the solve() function to calculate the inverse of 
##the matrix but retrieves the inverse from the cache if it was calculated before. 

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return (inv)
  }
mat <- x$get()
inv <- solve(mat,...)
x$setInverse(inv)
inv
## Return a matrix that is the inverse of 'x'
}
