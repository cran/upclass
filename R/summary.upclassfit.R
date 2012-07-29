.packageName <- 'upclass'

summary.upclassfit <- function (object, ...)
{
  if (attr(object, "class") != "upclassfit") 
    stop("Incorrect class")
  cat("\nFunction Call: \n")
  x <-object
  print(x$call)
  cat("\nNo in Training Set:\n",x$Ntrain,"\n")
  cat("\nNo in Test Set:\n",x$Ntest,"\n")
  cat("\nNo of Variables:\n",x$d,"\n")
  cat("\nNo of Groups:\n",x$G,"\n")
  cat("\nModel Name:\n",x$modelName,"\n")
  cat("\n_________________________________________\n")
  cat('\nParameters from mstep:\n')
  print(x$parameters)
  cat("\n_________________________________________\n")
  if(x$reportrate) {
    cat("\nTraining Data:\n")
    print(x$train)
    cat("\nTest Data:\n")
    print(x$test)
    
    if (!is.null(x$test$tab)) {
      cat("\n_________________________________________\n")
      cat("\nLabels for Test Data Provided\n")
      cat("\nTotal Misclassified:\n",x$test$rate,"\n")
      cat("\nBrier Score:\n",x$test$Brierscore,"\n")
      cat("\nClassification Table\n")
      print(x$test$tab)
    }
    cat("\n_________________________________________\n")
  }
  cat("\nLog likelihood:\n",x$ll,"\n")
  cat("\nBIC:\n", x$bic)
  cat("\n\nAvailable Components:\n")
  print(names(x))
  
}
