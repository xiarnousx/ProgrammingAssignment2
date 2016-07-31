## Below two functions demonstrate the usage of caching inverse matrix

## makeCacheMatirx save matrix and inverse matrix into cache

makeCacheMatrix <- function(x = matrix()) {

  im <- NULL
  set <- function(y) {
    x <<- y
    im <<- NULL
  }
  
  get <- function() x
  setInverseMatrix <- function(im_in) im <<- im_in
  getInverseMatrix <- function() im
  
  
  list (
    set = set,
    get = get,
    setInverseMatrix = setInverseMatrix,
    getInverseMatrix = getInverseMatrix
  )
}


## cacheSolve load invers matrix from cahce otherwise compute inverse matrix and store in cache

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  im <- x$getInverseMatrix()
  
  ## A hit return from cache
  if (!is.nul(im)) {
    message("Inverse Matrix From Cache")  
    return(im)
  }
  
  ## Compute invers matrix
  matrix <- x$get()
  im <- solve(matrix, ...)
  x$setInverseMatrix(im)
  
  ## return inverse matrix
  im
}
