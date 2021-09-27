vdp_equations <- c(
  "Y",
  "p['mu'] * (1 - X^2) * Y - X"
)

solve_model <- function(Y0, t, model, parms) {
  deSolve::ode(y = Y0, times = t, model, parms)
}

vdp <- function(t, y, p) {
  with(as.list(y), {
    dX <- eval(parse(text = vdp_equations[1]))
    dY <- eval(parse(text = vdp_equations[2]))
    list(c(X=dX, Y=dY))
  })
}



build_phase_data <- function(xgrid, ygrid, p) {
  vectors <- expand.grid(x = xgrid, y = ygrid)
  X <- vectors$x
  Y <- vectors$y
  vectors$dx <- eval(parse(text = vdp_equations[1]))
  vectors$dy <- eval(parse(text = vdp_equations[2]))
  vectors$mag <- sqrt(
    vectors$dx * vectors$dx + 
      vectors$dy * vectors$dy
  )
  vectors
}



generate_model_data <- function(model, pars, grid) {
  model_output <- solve_model(
    Y0 = c(X = 1, Y = 1),
    t = seq(0, 50, .1),
    model,
    pars
  )
  
  # time series (x = f(t), y = f(t))
  data <- data.frame(model_output)
  modelData <- list(t = data$time, X = data$X, Y = data$Y)
  
  # phase plan
  trajectoryData <- data[, c("X", "Y")]
  names(trajectoryData) <- NULL
  
  phaseData <- build_phase_data(seq(-5, 5), grid, pars)
  names(phaseData) <- NULL
  
  # return data
  list(
    lineData = modelData,
    phaseData = jsonlite::toJSON(phaseData, pretty = TRUE),
    trajectoryData = jsonlite::toJSON(trajectoryData, pretty = TRUE)
  )
}