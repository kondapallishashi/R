x <- 1:5
for (val in x) {
  if (val == 3){
    break
  }
  print(val)
}

#Next statement

y <- 1:5
for (val in y) {
  if (val == 3){
    next
  }
  print(val)
}