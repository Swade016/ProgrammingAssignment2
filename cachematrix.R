## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
## Create an empty field to store the inverted matrix in this environment
  invertedM <- NULL
  
  ## Create a setter property to store the value of cachedMatrix in the cached environment and re-null m
  set <- function(newMatrix) 
  {
    x <<- newMatrix
    invertedM <<- NULL
  }
  
  ## Create a getter property to return the field cachedMatrix
  get <- function() 
  {
    x
  }
  
  ## Create a function to invert the function variable into m.  Assume all invertedX are invertable
  setInverse <- function(invertedX)
  {
    invertedM <<- invertedX
  }    
    
  ## Create a function that returns the locally stored version of the inverted matrix
  getInverse <- function() 
  {
    invertedM
  }
  
  
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         ## Assign the value to invertedM the existing invertedM of the x class
  m <- x$getInverse()
  
  ## If invertedM already exists (not null), then returned the existing invertedM.  This works like a ref and ends the function
  if(!is.null(m)) 
  {
    message("getting inverted matrix")
    return(m)
  }
  
  ## Get the cached Matrix
  ##data <- x$get()
  
  ## Assign the cached inverted matrix to the inverted cached matrix
  ##n <- solve(data, ...)
  
  ## set the local cached matrix inversion property to the inverted matrix
  ##x$setInverse(n)
  x$setInverse(solve(x$get(), ...))
  
  ## Display the new matrix
  ##n
}
